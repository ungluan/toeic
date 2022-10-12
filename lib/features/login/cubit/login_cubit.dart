import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import '../../../repositories/authentication_repository.dart';
import 'authentication_cubit.dart';

part 'login_cubit.freezed.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  // static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  final AuthenticationRepository repository;
  // final ChatRepository _chatRepository;
  Logger logger = Logger();
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
    logger.d("username: $username");
    logger.d("password: $password");
    return repository.login(data);
  }

  // Future<void> facebookLogin() async {
  //   final LoginResult result = await FacebookAuth.instance
  //       .login(); // by default we request the email and the public profile
  //   if (result.status == LoginStatus.success) {
  //     final AccessToken? accessToken = result.accessToken;
  //     print('accessToken');
  //     print(accessToken?.token);
  //     emit(LoginState.loading());
  //     final data = {
  //       'grant_type': 'social',
  //       'social_provider': 'facebook',
  //       'social_access_token': accessToken?.token
  //     };
  //     return repository.login(data);
  //   }
  // }

  // Future<void> googleLogin() async {
  //   try {
  //     GoogleSignIn _googleSignIn = GoogleSignIn(
  //       // scopes: [
  //       //   // 'email',
  //       //   // 'https://www.googleapis.com/auth/contacts.readonly',
  //       // ],
  //     );
  //     await _googleSignIn.signOut();
  //     final result = await _googleSignIn.signIn();
  //     if(result!=null){
  //       final authentication = await result.authentication;
  //       print('accessToken');
  //       print(authentication.accessToken);
  //       final data = {
  //         'grant_type': 'social',
  //         'social_provider': 'google',
  //         'social_access_token': authentication.accessToken
  //       };
  //       return repository.login(data);
  //     }
  //   } catch (error) {
  //     print(error);
  //   }
  // }
  //
  // Future<void> twitterLogin() async {
  //   try {
  //     final twitterLogin = TwitterLogin(
  //       apiKey: 'aqpTAJ31ugNXCYzHmVv5rMMcZ',
  //       apiSecretKey: 'Uz5k3n1Nd9V2sXY4VXmbtslkzHOmRfE3WPvfBHwF6cIXNgUxSi',
  //       redirectURI: 'https://fow.q-connection.net',
  //     );
  //     final authResult = await twitterLogin.login();
  //     if (authResult.status == TwitterLoginStatus.loggedIn) {
  //       final data = {
  //         'grant_type': 'social',
  //         'social_provider': 'twitter',
  //         'twitter_token': authResult.authToken,
  //         'twitter_token_secret': authResult.authTokenSecret
  //       };
  //       return repository.login(data);
  //     }
  //   } catch (error) {
  //     print(error);
  //   }
  // }
  //
  // Future<void> appleLogin() async {
  //   try {
  //     final credential = await SignInWithApple.getAppleIDCredential(
  //       scopes: [
  //         AppleIDAuthorizationScopes.email,
  //         AppleIDAuthorizationScopes.fullName,
  //       ],
  //       webAuthenticationOptions: WebAuthenticationOptions(
  //         clientId:
  //         'com.qconnection.fowi.serviceid',
  //         redirectUri: Uri.parse(
  //           'https://portal.fowi.com.vn',
  //         ),
  //       ),
  //     );
  //
  //     IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
  //
  //     final data = {
  //       'id_token': credential.identityToken,
  //       'name': credential.userIdentifier,
  //       'device_id': iosInfo.identifierForVendor
  //     };
  //
  //     return repository.loginApple(data);
  //
  //   } catch (error) {
  //     print(error);
  //   }
  // }

}

@freezed
class LoginState with _$LoginState {
  const factory LoginState.loading() = LoginStateLoading;
  const factory LoginState.failed(String message) = LoginStateFailed;
  const factory LoginState.success() = LoginStateSuccess;
}
