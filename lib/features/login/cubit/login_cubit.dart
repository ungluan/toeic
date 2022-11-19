import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:toeic/utils/utils.dart';

import '../../../repositories/authentication_repository.dart';
import 'authentication_cubit.dart';

part 'login_cubit.freezed.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  // static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  final AuthenticationRepository repository;
  // final ChatRepository _chatRepository;
  LoginCubit(this.repository, /*this._chatRepository*/) : super(const LoginState.loading()) {
    repository.authenticationStateStream.listen((AuthenticationState state) {
      if (state is AuthenticationStateFailed) {
        emit(LoginState.failed(state.error));
      } else if (state is AuthenticationStateAuthenticated) {
        emit(const LoginState.success());
      }
    });
  }


  Future<void> login(
      {required String username, required String password}) async {
    emit(const LoginState.loading());
    final data = {'phone_number': username, 'password': password};
    logger(data);
    return repository.login(data);
  }


}

@freezed
class LoginState with _$LoginState {
  const factory LoginState.loading() = LoginStateLoading;
  const factory LoginState.failed(String message) = LoginStateFailed;
  const factory LoginState.success() = LoginStateSuccess;
}
