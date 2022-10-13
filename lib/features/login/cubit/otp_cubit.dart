import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:toeic/apis/models/Verify_response.dart';
import 'package:toeic/utils/utils.dart';

import '../../../apis/models/user.dart' as u;
import '../../../repositories/authentication_repository.dart';

part 'otp_cubit.freezed.dart';

@injectable
class OtpCubit extends Cubit<OtpState> {
  final AuthenticationRepository repository;
  late String _verificationId;

  OtpCubit(this.repository) : super(const OtpState.loading());

  Future<void> checkUserExist(
      {required String phoneNumber, required String email}) async {
    try {
      await repository.checkUserExists(phoneNumber, email);
      emit(const OtpState.userNotExisted());
    } on DioError catch (e) {
      if (e.response?.statusCode == 409) {
        logger(e.response?.data);
        var response = VerifyResponse.fromJson(e.response?.data);
        emit(OtpState.userExisted({
          "phoneNumber": response.detail?.phoneNumber ?? '',
          "email": response.detail?.email ?? ''
        }));
      } else {
        emit(const OtpState.registerFailed(
            "Có lỗi xảy ra, vui lòng thử lại sau."));
      }
    }
  }

  Future<void> sendOTP({required String phoneNumber}) async {
    emit(const OtpState.loading());
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 120),
      verificationCompleted: (PhoneAuthCredential credential) {
        emit(const OtpState.verifySuccess());
      },
      verificationFailed: (FirebaseAuthException e) {
        emit(OtpState.verifyFailed(
            e.message ?? 'Có lỗi xảy ra, vui lòng thử lại sau.'));
      },
      codeSent: (String verificationId, int? resendToken) {
        _verificationId = verificationId;
        emit(const OtpState.sendSuccess());
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        emit(const OtpState.requestTimeOut());
      },
    );
  }

// Future<void> checkAndSendOtp(BuildContext context, String username,
//     String email, String phone, String password) async {
//   try {
//     emit(OtpState.loading());
//     final result =
//         await repository.checkUserExists(username, email, phone, password);
//     if (!result.status!) {
//       sendOtp(phone);
//     } else {
//       emit(OtpState.checkUserFailed(result.message!));
//     }
//   } catch (e) {
//     emit(OtpState.sendFailed(e.toString()));
//   }
// }
//
// Future<void> sendOtp(String phone, {int register = 1}) async {
//   try {
//     emit(OtpState.loading());
//     final data = await repository.sendOtp(phone, register);
//     if (data.error == false)
//       emit(OtpState.sendSuccess());
//     else
//       emit(OtpState.sendFailed(data.message));
//   } on DioError catch (e) {
//     DataResponse data = DataResponse.fromJson(e.response?.data);
//     emit(OtpState.sendFailed(data.message));
//   }
// }
//
  Future<void> verifyOtp(
      {required String smsCode/*, required String phone*/}) async {
    emit(const OtpState.loading());

    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: _verificationId, smsCode: smsCode);
      // Sign the user in (or link) with the credential
      UserCredential userCredential = await auth.signInWithCredential(credential);
      if(userCredential.user != null){
        emit(const OtpState.verifySuccess());
      }
      emit(const OtpState.verifyFailed("Mã OTP không chính xác"));
    } catch (e) {
      emit(OtpState.verifyFailed(e.toString()));
    }
  }
//
// Future<void> register(Map<String, dynamic> data) async {
//   try {
//     emit(OtpState.loading());
//     final response = await repository.register(data);
//     if (response.error == false) {
//       emit(OtpState.registerSuccess(response.data.user, data['password']));
//     } else {
//       emit(OtpState.registerFailed(response.message));
//     }
//   } catch (e) {
//     if (e is DioError && e.response?.statusCode != 500) {
//       DataResponse dataResponse = DataResponse.fromJson(e.response?.data);
//       emit(OtpState.registerFailed(dataResponse.message.toString()));
//     } else {
//       emit(OtpState.registerFailed(e.toString()));
//     }
//   }
// }
}

@freezed
class OtpState with _$OtpState {
  const factory OtpState.loading() = OtpStateLoading;

  const factory OtpState.userExisted(Map<String, String> data) =
      OtpStateUserExisted;

  const factory OtpState.userNotExisted() = OtpStateUserNotExisted;

  const factory OtpState.sendFailed(String error) = OtpStateSendFailed;

  const factory OtpState.verifyFailed(String error) = OtpStateVerifyFailed;

  const factory OtpState.verifySuccess() = OtpStateVerifySuccess;

  const factory OtpState.sendSuccess() = OtpStateSendSuccess;

  const factory OtpState.registerFailed(String error) = OtpStateRegisterFailed;

  const factory OtpState.registerSuccess(u.User user, String password) =
      OtpStateRegisterSuccess;

  const factory OtpState.requestTimeOut() = OtpStateRequestTimeOut;
}
