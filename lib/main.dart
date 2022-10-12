import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:toeic/features/blank_page.dart';
import 'package:toeic/features/main_page.dart';

import 'features/login/cubit/authentication_cubit.dart';
import 'features/login/view/login_page.dart';
import 'hive/hive_service.dart';
import 'injection/injection.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Hive.initFlutter();

  // if(!Hive.isAdapterRegistered(0)){
  //   Hive.registerAdapter(UserAdapter());
  // }

  await Hive.openBox(boxName);
  // await Hive.openBox<User>("user_box");

  // await Firebase.initializeApp();
  // setupNotification();
  configureInjection();
  AuthenticationCubit cubit = getIt<AuthenticationCubit>();
  await cubit.dispatch();

  initializeDateFormatting().then((_) => runApp(MyApp(
        cubit: cubit,
      )));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.cubit}) : super(key: key);
  final AuthenticationCubit cubit;

  // This widgets is the root of your application.

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
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
            create: (BuildContext context) => cubit,
          ),
        ],
        child: BlocBuilder<AuthenticationCubit, AuthenticationState>(
          bloc: cubit,
          builder: (BuildContext context, state) => state.maybeWhen(
            authenticated: () => HomePage(),
            unauthenticated: () => LoginPage(),
            orElse: () => const BlankPage(),
          ),
        ),
      ),
    );
  }
}

setupNotification() {
  AwesomeNotifications().initialize(
    'resource://drawable/res_notification_app_icon',
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic Notifications',
        channelDescription: "Basic Notifications",
        defaultColor: Colors.red,
        importance: NotificationImportance.High,
        channelShowBadge: true,
      ),
      NotificationChannel(
        channelKey: 's_box_notification',
        channelName: 'S-Box Notifications',
        channelDescription: "Basic Notifications",
        defaultColor: Colors.red,
        importance: NotificationImportance.High,
        channelShowBadge: true,
      ),
      NotificationChannel(
        channelKey: 'scheduled_channel',
        channelName: 'Scheduled Notifications',
        channelDescription: 'Scheduled Notifications',
        defaultColor: Colors.red,
        locked: true,
        importance: NotificationImportance.High,
        soundSource: 'resource://raw/res_custom_notification',
      ),
    ],
  );
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    Logger().d('${bloc.runtimeType} $change');
  }
}
