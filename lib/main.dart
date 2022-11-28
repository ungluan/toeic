import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';
import 'package:toeic/features/blank_page.dart';
import 'package:toeic/features/main_page.dart';
import 'package:toeic/features/update_profile_lv1/update_profile_page.dart';
import 'package:toeic/services/notification.dart';
import 'package:toeic/utils/utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'features/login/cubit/authentication_cubit.dart';
import 'features/login/view/login_page.dart';
import 'hive/hive_service.dart';
import 'injection/injection.dart';

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  // ignore: avoid_print
  logger("notificationTapBackground");
  print('notification(${notificationResponse.id}) action tapped: '
      '${notificationResponse.actionId} with'
      ' payload: ${notificationResponse.payload}');
  if (notificationResponse.input?.isNotEmpty ?? false) {
    // ignore: avoid_print
    print(
        'notification action tapped with input: ${notificationResponse.input}');
  }
}

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Hive.initFlutter();
  await Hive.openBox(boxName);
  await Firebase.initializeApp();
  configureInjection();
  var notificationService = getIt<NotificationService>();
  await notificationService.init();
  AuthenticationCubit cubit = getIt<AuthenticationCubit>();

  await cubit.dispatch();

  runApp(MyApp(cubit: cubit));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key, required this.cubit}) : super(key: key);
  final AuthenticationCubit cubit;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widgets is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          // BlocProvider<UserCubit>(
          //   create: (BuildContext context) => getIt<UserCubit>(),
          // ),
          BlocProvider<AuthenticationCubit>(
            create: (BuildContext context) => widget.cubit,
          ),
        ],
        child: BlocBuilder<AuthenticationCubit, AuthenticationState>(
          bloc: widget.cubit,
          builder: (BuildContext context, state) => state.maybeWhen(
            authenticated: () => MainPage(),
            level1: () => const UpdateProfilePage(),
            unauthenticated: () => const LoginPage(),
            orElse: () => const BlankPage(),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _setup();
  }

  void _setup() async {
    await Future.delayed(const Duration(seconds: 1));
    FlutterNativeSplash.remove();
  }
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    Logger().d('${bloc.runtimeType} $change');
  }
}
