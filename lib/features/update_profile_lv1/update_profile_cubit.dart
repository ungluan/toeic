import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:toeic/injection/injection.dart';

import '../../hive/hive_service.dart';
import '../../repositories/authentication_repository.dart';
import '../../repositories/user_repository.dart';

part 'update_profile_cubit.freezed.dart';

@injectable
class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final UserRepository userRepository;
  final AuthenticationRepository authenticationRepository;
  HiveService hive = getIt<HiveService>();
  UpdateProfileCubit(this.userRepository, this.authenticationRepository)
      : super(const UpdateProfileState.loading());

  void setup() {
    emit(const UpdateProfileState.loaded());
  }

  Future<void> updateLv1(Map<String, dynamic> data) async {
    try {
      emit(const UpdateProfileState.loading());
      await userRepository.updateLv1(data);
      await authenticationRepository.getUserInfo();
      emit(const UpdateProfileState.success());
    } on DioError catch (e) {
      emit(UpdateProfileState.failed(e.message));
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
}
