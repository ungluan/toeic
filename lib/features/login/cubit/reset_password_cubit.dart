import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../repositories/authentication_repository.dart';

part 'reset_password_cubit.freezed.dart';

@injectable
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final AuthenticationRepository repository;

  ResetPasswordCubit(this.repository)
      : super(const ResetPasswordState.loading());

  Future<void> resetPassword(
      {required String password, required String phone}) async {
    try {
      emit(const ResetPasswordState.loading());
      await repository
          .resetPassword({"phone_number": phone, "password": password});
      emit(const ResetPasswordState.success());
    } on DioError catch (e) {
      if(e.response?.statusCode == 406){
        emit(const ResetPasswordState.duplicate());
      }
      else {
        emit(ResetPasswordState.failed(e.message));
      }
    }
  }
}

@freezed
class ResetPasswordState with _$ResetPasswordState {
  const factory ResetPasswordState.loading() = ResetPasswordStateLoading;

  const factory ResetPasswordState.duplicate() = ResetPasswordStateDuplicate;

  const factory ResetPasswordState.unDuplicate() =
      ResetPasswordStateUnDuplicate;

  const factory ResetPasswordState.failed(String error) =
      ResetPasswordStateFailed;

  const factory ResetPasswordState.success() = ResetPasswordStateSuccess;
}
