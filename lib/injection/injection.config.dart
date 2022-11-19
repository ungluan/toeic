// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../apis/rest_client_factory.dart' as _i5;
import '../features/login/cubit/authentication_cubit.dart' as _i20;
import '../features/login/cubit/login_cubit.dart' as _i14;
import '../features/login/cubit/otp_cubit.dart' as _i15;
import '../features/login/cubit/register_cubit.dart' as _i16;
import '../features/login/cubit/reset_password_cubit.dart' as _i17;
import '../features/practice/cubit/examination_cubit.dart' as _i21;
import '../features/practice/cubit/test_cubit.dart' as _i18;
import '../features/update_profile_lv1/update_profile_cubit.dart' as _i19;
import '../hive/hive_service.dart' as _i3;
import '../repositories/authentication_repository.dart' as _i10;
import '../repositories/examination_repository.dart' as _i12;
import '../repositories/impl/authentication_repository.dart' as _i11;
import '../repositories/impl/examination_repository.dart' as _i13;
import '../repositories/impl/test_repository.dart' as _i7;
import '../repositories/impl/user_repository.dart' as _i9;
import '../repositories/test_repository.dart' as _i6;
import '../repositories/user_repository.dart' as _i8;
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
  gh.singleton<_i5.RestClientFactory>(_i5.RestClientFactory());
  gh.lazySingleton<_i6.TestRepository>(() => _i7.TestRepositoryImpl(
        get<_i5.RestClientFactory>(),
        get<_i3.HiveService>(),
      ));
  gh.lazySingleton<_i8.UserRepository>(() => _i9.UserRepositoryImpl(
        get<_i5.RestClientFactory>(),
        get<_i3.HiveService>(),
      ));
  gh.lazySingleton<_i10.AuthenticationRepository>(
      () => _i11.AuthenticationRepositoryImpl(
            get<_i5.RestClientFactory>(),
            get<_i3.HiveService>(),
          ));
  gh.lazySingleton<_i12.ExaminationRepository>(
      () => _i13.ExaminationRepositoryImpl(
            get<_i5.RestClientFactory>(),
            get<_i3.HiveService>(),
          ));
  gh.factory<_i14.LoginCubit>(
      () => _i14.LoginCubit(get<_i10.AuthenticationRepository>()));
  gh.factory<_i15.OtpCubit>(
      () => _i15.OtpCubit(get<_i10.AuthenticationRepository>()));
  gh.factory<_i16.RegisterCubit>(() =>
      _i16.RegisterCubit(authRepository: get<_i10.AuthenticationRepository>()));
  gh.factory<_i17.ResetPasswordCubit>(
      () => _i17.ResetPasswordCubit(get<_i10.AuthenticationRepository>()));
  gh.factory<_i18.TestCubit>(() => _i18.TestCubit(
        get<_i8.UserRepository>(),
        get<_i6.TestRepository>(),
        get<_i10.AuthenticationRepository>(),
        get<_i12.ExaminationRepository>(),
      ));
  gh.factory<_i19.UpdateProfileCubit>(() => _i19.UpdateProfileCubit(
        get<_i8.UserRepository>(),
        get<_i10.AuthenticationRepository>(),
      ));
  gh.factory<_i20.AuthenticationCubit>(
      () => _i20.AuthenticationCubit(get<_i10.AuthenticationRepository>()));
  gh.factory<_i21.ExaminationCubit>(() => _i21.ExaminationCubit(
        get<_i10.AuthenticationRepository>(),
        get<_i12.ExaminationRepository>(),
      ));
  return get;
}
