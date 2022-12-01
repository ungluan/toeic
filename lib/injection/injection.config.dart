// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../apis/rest_client_factory.dart' as _i6;
import '../features/activity/cubit/user_cubit.dart' as _i21;
import '../features/login/cubit/authentication_cubit.dart' as _i22;
import '../features/login/cubit/login_cubit.dart' as _i15;
import '../features/login/cubit/otp_cubit.dart' as _i16;
import '../features/login/cubit/register_cubit.dart' as _i17;
import '../features/login/cubit/reset_password_cubit.dart' as _i18;
import '../features/practice/cubit/examination_cubit.dart' as _i23;
import '../features/practice/cubit/test_cubit.dart' as _i19;
import '../features/update_profile_lv1/update_profile_cubit.dart' as _i20;
import '../hive/hive_service.dart' as _i3;
import '../repositories/authentication_repository.dart' as _i11;
import '../repositories/examination_repository.dart' as _i13;
import '../repositories/impl/authentication_repository.dart' as _i12;
import '../repositories/impl/examination_repository.dart' as _i14;
import '../repositories/impl/test_repository.dart' as _i8;
import '../repositories/impl/user_repository.dart' as _i10;
import '../repositories/test_repository.dart' as _i7;
import '../repositories/user_repository.dart' as _i9;
import '../services/notification.dart' as _i5;
import '../ui_kits/widgets/cubits/loading_cubit.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.singleton<_i3.HiveService>(_i3.HiveService());
  gh.factory<_i4.LoadingCubit>(() => _i4.LoadingCubit());
  gh.singleton<_i5.NotificationService>(_i5.NotificationService());
  gh.singleton<_i6.RestClientFactory>(_i6.RestClientFactory());
  gh.lazySingleton<_i7.TestRepository>(() => _i8.TestRepositoryImpl(
        get<_i6.RestClientFactory>(),
        get<_i3.HiveService>(),
      ));
  gh.lazySingleton<_i9.UserRepository>(() => _i10.UserRepositoryImpl(
        get<_i6.RestClientFactory>(),
        get<_i3.HiveService>(),
      ));
  gh.lazySingleton<_i11.AuthenticationRepository>(
      () => _i12.AuthenticationRepositoryImpl(
            get<_i6.RestClientFactory>(),
            get<_i3.HiveService>(),
            get<_i9.UserRepository>(),
          ));
  gh.lazySingleton<_i13.ExaminationRepository>(
      () => _i14.ExaminationRepositoryImpl(
            get<_i6.RestClientFactory>(),
            get<_i3.HiveService>(),
          ));
  gh.factory<_i15.LoginCubit>(
      () => _i15.LoginCubit(get<_i11.AuthenticationRepository>()));
  gh.factory<_i16.OtpCubit>(
      () => _i16.OtpCubit(get<_i11.AuthenticationRepository>()));
  gh.factory<_i17.RegisterCubit>(() =>
      _i17.RegisterCubit(authRepository: get<_i11.AuthenticationRepository>()));
  gh.factory<_i18.ResetPasswordCubit>(
      () => _i18.ResetPasswordCubit(get<_i11.AuthenticationRepository>()));
  gh.factory<_i19.TestCubit>(() => _i19.TestCubit(
        get<_i9.UserRepository>(),
        get<_i7.TestRepository>(),
        get<_i11.AuthenticationRepository>(),
        get<_i13.ExaminationRepository>(),
      ));
  gh.factory<_i20.UpdateProfileCubit>(() => _i20.UpdateProfileCubit(
        get<_i9.UserRepository>(),
        get<_i11.AuthenticationRepository>(),
      ));
  gh.factory<_i21.UserCubit>(() => _i21.UserCubit(
        get<_i11.AuthenticationRepository>(),
        get<_i9.UserRepository>(),
      ));
  gh.factory<_i22.AuthenticationCubit>(() => _i22.AuthenticationCubit(
        get<_i11.AuthenticationRepository>(),
        get<_i9.UserRepository>(),
      ));
  gh.factory<_i23.ExaminationCubit>(() => _i23.ExaminationCubit(
        get<_i11.AuthenticationRepository>(),
        get<_i13.ExaminationRepository>(),
        get<_i7.TestRepository>(),
      ));
  return get;
}
