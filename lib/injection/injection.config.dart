// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../apis/rest_client_factory.dart' as _i7;
import '../database/database_manager.dart' as _i3;
import '../features/activity/cubit/history_cubit.dart' as _i16;
import '../features/activity/cubit/user_cubit.dart' as _i27;
import '../features/home/cubit/barchart_cubit.dart' as _i29;
import '../features/home/cubit/home_cubit.dart' as _i17;
import '../features/home/cubit/piechart_cubit.dart' as _i20;
import '../features/home/cubit/progress_cubit.dart' as _i21;
import '../features/home/cubit/radar_chart_cubit.dart' as _i22;
import '../features/login/cubit/authentication_cubit.dart' as _i28;
import '../features/login/cubit/login_cubit.dart' as _i18;
import '../features/login/cubit/otp_cubit.dart' as _i19;
import '../features/login/cubit/register_cubit.dart' as _i23;
import '../features/login/cubit/reset_password_cubit.dart' as _i24;
import '../features/practice/cubit/examination_cubit.dart' as _i30;
import '../features/practice/cubit/test_cubit.dart' as _i25;
import '../features/update_profile_lv1/update_profile_cubit.dart' as _i26;
import '../hive/hive_service.dart' as _i4;
import '../repositories/authentication_repository.dart' as _i12;
import '../repositories/examination_repository.dart' as _i14;
import '../repositories/impl/authentication_repository.dart' as _i13;
import '../repositories/impl/examination_repository.dart' as _i15;
import '../repositories/impl/test_repository.dart' as _i9;
import '../repositories/impl/user_repository.dart' as _i11;
import '../repositories/test_repository.dart' as _i8;
import '../repositories/user_repository.dart' as _i10;
import '../services/notification.dart' as _i6;
import '../ui_kits/widgets/cubits/loading_cubit.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i3.DatabaseProvider>(() => _i3.DatabaseProvider());
  gh.singleton<_i4.HiveService>(_i4.HiveService());
  gh.factory<_i5.LoadingCubit>(() => _i5.LoadingCubit());
  gh.singleton<_i6.NotificationService>(_i6.NotificationService());
  gh.singleton<_i7.RestClientFactory>(_i7.RestClientFactory());
  gh.lazySingleton<_i8.TestRepository>(() => _i9.TestRepositoryImpl(
        get<_i7.RestClientFactory>(),
        get<_i4.HiveService>(),
      ));
  gh.lazySingleton<_i10.UserRepository>(() => _i11.UserRepositoryImpl(
        get<_i7.RestClientFactory>(),
        get<_i4.HiveService>(),
      ));
  gh.lazySingleton<_i12.AuthenticationRepository>(
      () => _i13.AuthenticationRepositoryImpl(
            get<_i7.RestClientFactory>(),
            get<_i4.HiveService>(),
            get<_i10.UserRepository>(),
          ));
  gh.lazySingleton<_i14.ExaminationRepository>(
      () => _i15.ExaminationRepositoryImpl(
            get<_i7.RestClientFactory>(),
            get<_i4.HiveService>(),
          ));
  gh.factory<_i16.HistoryCubit>(() => _i16.HistoryCubit(
        get<_i12.AuthenticationRepository>(),
        get<_i10.UserRepository>(),
        get<_i14.ExaminationRepository>(),
      ));
  gh.factory<_i17.HomeCubit>(() => _i17.HomeCubit(
        get<_i12.AuthenticationRepository>(),
        get<_i10.UserRepository>(),
        get<_i14.ExaminationRepository>(),
      ));
  gh.factory<_i18.LoginCubit>(
      () => _i18.LoginCubit(get<_i12.AuthenticationRepository>()));
  gh.factory<_i19.OtpCubit>(
      () => _i19.OtpCubit(get<_i12.AuthenticationRepository>()));
  gh.factory<_i20.PieChartCubit>(() => _i20.PieChartCubit(
        get<_i10.UserRepository>(),
        get<_i14.ExaminationRepository>(),
      ));
  gh.factory<_i21.ProgressCubit>(() => _i21.ProgressCubit(
        get<_i10.UserRepository>(),
        get<_i14.ExaminationRepository>(),
      ));
  gh.factory<_i22.RadarChartCubit>(() => _i22.RadarChartCubit(
        get<_i10.UserRepository>(),
        get<_i14.ExaminationRepository>(),
      ));
  gh.factory<_i23.RegisterCubit>(() =>
      _i23.RegisterCubit(authRepository: get<_i12.AuthenticationRepository>()));
  gh.factory<_i24.ResetPasswordCubit>(
      () => _i24.ResetPasswordCubit(get<_i12.AuthenticationRepository>()));
  gh.factory<_i25.TestCubit>(() => _i25.TestCubit(
        get<_i10.UserRepository>(),
        get<_i8.TestRepository>(),
        get<_i12.AuthenticationRepository>(),
        get<_i14.ExaminationRepository>(),
      ));
  gh.factory<_i26.UpdateProfileCubit>(() => _i26.UpdateProfileCubit(
        get<_i10.UserRepository>(),
        get<_i12.AuthenticationRepository>(),
      ));
  gh.factory<_i27.UserCubit>(() => _i27.UserCubit(
        get<_i12.AuthenticationRepository>(),
        get<_i10.UserRepository>(),
      ));
  gh.factory<_i28.AuthenticationCubit>(() => _i28.AuthenticationCubit(
        get<_i12.AuthenticationRepository>(),
        get<_i10.UserRepository>(),
      ));
  gh.factory<_i29.BarChartCubit>(() => _i29.BarChartCubit(
        get<_i10.UserRepository>(),
        get<_i14.ExaminationRepository>(),
      ));
  gh.factory<_i30.ExaminationCubit>(() => _i30.ExaminationCubit(
        get<_i12.AuthenticationRepository>(),
        get<_i14.ExaminationRepository>(),
        get<_i8.TestRepository>(),
      ));
  return get;
}
