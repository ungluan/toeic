// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../apis/rest_client_factory.dart' as _i5;
import '../features/login/cubit/authentication_cubit.dart' as _i11;
import '../features/login/cubit/login_cubit.dart' as _i8;
import '../features/login/cubit/otp_cubit.dart' as _i9;
import '../features/login/cubit/register_cubit.dart' as _i10;
import '../hive/hive_service.dart' as _i3;
import '../repositories/authentication_repository.dart' as _i6;
import '../repositories/impl/authentication_repository.dart' as _i7;
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
  gh.lazySingleton<_i6.AuthenticationRepository>(
      () => _i7.AuthenticationRepositoryImpl(
            get<_i5.RestClientFactory>(),
            get<_i3.HiveService>(),
          ));
  gh.factory<_i8.LoginCubit>(
      () => _i8.LoginCubit(get<_i6.AuthenticationRepository>()));
  gh.factory<_i9.OtpCubit>(
      () => _i9.OtpCubit(get<_i6.AuthenticationRepository>()));
  gh.factory<_i10.RegisterCubit>(() =>
      _i10.RegisterCubit(authRepository: get<_i6.AuthenticationRepository>()));
  gh.factory<_i11.AuthenticationCubit>(
      () => _i11.AuthenticationCubit(get<_i6.AuthenticationRepository>()));
  return get;
}
