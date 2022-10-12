import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../hive/hive_service.dart';
import '../../../repositories/authentication_repository.dart';

part 'authentication_cubit.freezed.dart';

@injectable
class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationRepository authenticationRepository;
  // final DatabaseManager _databaseManager;
  // GainCoinRepository gainCoinRepository;
  HiveService hive = HiveService();
  AuthenticationCubit(this.authenticationRepository,/* this.gainCoinRepository,
      this._databaseManager*/)
      : super(const AuthenticationState.unauthenticated()) {
    authenticationRepository.authenticationStateStream.listen((state) {
      emit(state);
    });
  }

  Future<void> dispatch() {
    return authenticationRepository.dispatch();
  }

  // Future<void> changeNotificationSetting() {
  //   return authenticationRepository.changeNotificationSetting();
  // }

  // Future<void> saveToken() async {
  //   try {
  //     await authenticationRepository.saveToken();
  //   } catch (e) {
  //     fowLog(e);
  //   }
  // }

  // void showLevel1Page() {
  //   hive.updateLevel('level1');
  //   dispatch();
  // }
  //
  // void showLevel2Page() {
  //   hive.updateLevel('level2');
  //   dispatch();
  // }
  //
  // void showIdealPartnerPage() {
  //   hive.updateLevel('ideal-partner');
  //   dispatch();
  // }
  //
  // void showMainPage() {
  //   hive.updateLevel('');
  //   dispatch();
  // }
  //
  // void showPurposePage() {
  //   hive.updateLevel("purpose");
  //   dispatch();
  // }

  // Future<void> logout() async {
  //   await _databaseManager.messageDao.deleteTable();
  //   await _databaseManager.conversationDao.deleteTable();
  //   return authenticationRepository.logout();
  // }

  // void updateOnBoarding(bool value) {
  //   authenticationRepository.updateOnboarding(value);
  // }
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
