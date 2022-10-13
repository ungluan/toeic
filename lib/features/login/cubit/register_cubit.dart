import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../repositories/authentication_repository.dart';

part 'register_cubit.freezed.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  final AuthenticationRepository authRepository;
  RegisterCubit({required this.authRepository}) : super(const RegisterState.loading()) {
    authRepository.dataStream.listen((data) {
      emit(RegisterState.loaded(data));
    });
  }

  Future<void> register(Map<String, dynamic> data) async {
    try{
      await authRepository.register(data);
      emit(const RegisterState.successful());
    } on DioError catch(e){
      emit(RegisterState.failed(e.message));
    }
  }
}

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.loading() = RegisterStateLoading;
  const factory RegisterState.failed(String error) = RegisterStateFailed;
  const factory RegisterState.successful() = RegisterStateSuccessful;
  const factory RegisterState.loaded(Map<String, dynamic> data) =
      RegisterStateLoaded;
}
