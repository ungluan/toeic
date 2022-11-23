import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:toeic/repositories/user_repository.dart';

import '../../../hive/hive_service.dart';
import '../../../repositories/authentication_repository.dart';

part 'authentication_cubit.freezed.dart';

@injectable
class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationRepository authenticationRepository;
  UserRepository userRepository;
  HiveService hive = HiveService();
  AuthenticationCubit(this.authenticationRepository, this.userRepository,
      /*this._databaseManager*/)
      : super(const AuthenticationState.unauthenticated()) {
    authenticationRepository.authenticationStateStream.listen((state) {
      emit(state);
    });
  }

  Future<void> dispatch() {
    return authenticationRepository.dispatch();
  }

  Future<void> logout() async {
    hive.updateToken('');
    authenticationRepository.dispatch();
  }

}

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState.unauthenticated() =
  AuthenticationStateUnAuthenticated;
  const factory AuthenticationState.authenticated() =
  AuthenticationStateAuthenticated;
  // const factory AuthenticationState.welcome() = AuthenticationStateWelcome;
  // const factory AuthenticationState.terms() = AuthenticationStateTerms;
  // const factory AuthenticationState.tokenExpires() =
  // AuthenticationStateTokenExpires;
  const factory AuthenticationState.failed(String error) =
  AuthenticationStateFailed;
  const factory AuthenticationState.otp(Map<String, dynamic> data) =
  AuthenticationStateOtp;
  // const factory AuthenticationState.purpose() = AuthenticationStatePurpose;
  const factory AuthenticationState.level1() = AuthenticationStateLevel1;
  // const factory AuthenticationState.level2() = AuthenticationStateLevel2;
  // const factory AuthenticationState.idealPartner() = AuthenticationStateIdealPartner;
}
