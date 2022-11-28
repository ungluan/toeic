import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:toeic/hive/hive_service.dart';
import 'package:toeic/injection/injection.dart';
import '../../../apis/models/user.dart';
import '../../../repositories/authentication_repository.dart';
import '../../../repositories/user_repository.dart';
import '../../../utils/utils.dart';

part 'user_cubit.freezed.dart';

@injectable
class UserCubit extends Cubit<UserState> {
  final hive = getIt<HiveService>();
  final AuthenticationRepository authenticationRepository;
  final UserRepository userRepository;
  UserCubit(this.authenticationRepository, this.userRepository)
      : super(const UserState.loading()) {
    User user = authenticationRepository.user!;
    emit(UserState.loaded(user));
    authenticationRepository.userStream.listen((user) {
      // emit(UserState.loaded(user));
    });
  }

  Future<void> getUser(String userId) async {
    try {
      emit(const UserState.loading());
      final response = await authenticationRepository.getUserInfo();
      emit(UserState.loaded(response));
    } on DioError catch (e) {
      emit(UserState.failed(e.message));
    }
  }

  Future<void> updateAvatar(File file) async {
    var formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(file.path)
    });
    try {
      emit(const UserState.loading());
      await userRepository.updateAvatar(formData);
      final response = await authenticationRepository.getUserInfo();
      emit(UserState.loaded(response));
    } on DioError catch (e) {
      emit(UserState.failed(e.message));
    }
  }

  Future<void> updateUser(Map<String, dynamic> data) async {
    FormData formData = FormData.fromMap(data);
    try {
      emit(const UserState.loading());
      final response = await userRepository.updateUserByAdmin(user!.id!, formData);
      logger(hive.token);
      hive.updateToken(response!.replaceAll('"', ""));
      logger(hive.token);
      await authenticationRepository.getUserInfo();
      emit(UserState.updated());
    } on DioError catch (e) {
      emit(UserState.failed(e.message));
    }
  }


  User? get user => authenticationRepository.user;
}

@freezed
class UserState with _$UserState {
  const factory UserState.loading() = UserStateLoading;
  const factory UserState.loaded(User user) = UserStateInfoLoaded;
  const factory UserState.updated() = UserStateUpdated;
  const factory UserState.failed(String error) = UserStateFailed;
}
