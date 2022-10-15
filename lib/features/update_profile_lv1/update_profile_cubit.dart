import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:toeic/features/login/cubit/authentication_cubit.dart';
import 'package:toeic/injection/injection.dart';
import '../../hive/hive_service.dart';
import '../../repositories/authentication_repository.dart';
import '../../repositories/user_repository.dart';

part 'update_profile_cubit.freezed.dart';

@injectable
class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final UserRepository userRepository;
  final AuthenticationRepository authenticationRepository;
  final storageRef = FirebaseStorage.instance.ref();
  HiveService hive = getIt<HiveService>();

  UpdateProfileCubit(this.userRepository, this.authenticationRepository)
      : super(const UpdateProfileState.loading());

  void setup() {
    emit(const UpdateProfileState.loaded());
  }

  Future<void> updateLv1(Map<String, dynamic> rawData, File file) async {
    try {
      emit(const UpdateProfileState.loading());
      var url = await uploadImageToFireBaseStorage(file);
      if (url.isNotEmpty) {
        rawData["avatar"] = url.replaceAll('/', '%2F');
        // print(rawData);
        await userRepository.updateLv1(rawData);
        authenticationRepository.dispatch();
        emit(const UpdateProfileState.success());
      }
    } on DioError catch (e) {
      emit(UpdateProfileState.failed(e.message));
    }
  }

  Future<String> uploadImageToFireBaseStorage(File file) async {
    // Create a child reference
    // imagesRef now points to "images"
    int timestamp = DateTime.now().microsecondsSinceEpoch;
    final avatarRef = storageRef.child("images/avatars/$timestamp");
    try {
      await avatarRef.putFile(
        file,
        SettableMetadata(
          contentType: "image/jpeg",
        ),
      );
      return avatarRef.fullPath;
    } on FirebaseException catch (e) {
      emit(UpdateProfileState.uploadFileFailed(e.message ?? ''));
      return '';
    }
  }

  void reset() {
    emit(const UpdateProfileState.loading());
  }

// Future<void> updateProfileLevel2(
//     /*List<File> fileList,*/ Map<String, dynamic> data) async {
//   try {
//     emit(const UpdateProfileState.loading());
//     final response =
//         // await userRepository.updateProfileLevel2(/*fileList,*/ data);
//     await userRepository.updateProfileLv2(data);
//     if (response.error == false) {
//       await authenticationRepository.getUserInfo();
//       emit(const UpdateProfileState.success());
//     } else {
//       emit(UpdateProfileState.failed(response.message.toString()));
//     }
//   } catch (e) {
//     print(e.toString());
//     emit(UpdateProfileState.failed(e.toString()));
//   }
// }

// Future<void> updateIdealPartner(Map<String, dynamic> data) async {
//   try {
//     emit(UpdateProfileState.loading());
//     final response =
//     await userRepository.updateIdealPartner(data);
//     if (response.error == false) {
//       await authenticationRepository.getUserInfo();
//       emit(UpdateProfileState.success());
//     } else {
//       emit(UpdateProfileState.failed(response.message.toString()));
//     }
//   } catch (e) {
//     print(e.toString());
//     emit(UpdateProfileState.failed(e.toString()));
//   }
// }
// Future<void> editProfileLv1(Map<String, dynamic> data) async {
//   try {
//     emit(UpdateProfileState.loading());
//     final response = await userRepository.editProfileLv1(data);
//     if (response.error == false) {
//       await authenticationRepository.getUserInfo();
//       emit(UpdateProfileState.success());
//     } else {
//       // dialogUtil.showToast(response.message);
//       emit(UpdateProfileState.failed(response.message));
//     }
//   } catch (e) {
//     // dialogUtil.showToast(e.toString());
//     emit(UpdateProfileState.failed(e.toString()));
//   }
// }
}

@freezed
class UpdateProfileState with _$UpdateProfileState {
  const factory UpdateProfileState.loading() = UpdateProfileStateLoading;

  const factory UpdateProfileState.failed(String error) =
      UpdateProfileStateFailed;

  const factory UpdateProfileState.loaded() = UpdateProfileStateLoaded;

  const factory UpdateProfileState.success() = UpdateProfileStateSuccess;

  const factory UpdateProfileState.uploadFileFailed(String error) =
      UpdateProfileStateUploadFileFailed;
}
