import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'features/login/view/login_page.dart';
import 'hive/hive_service.dart';
import 'injection/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  // if(!Hive.isAdapterRegistered(0)){
  //   Hive.registerAdapter(UserAdapter());
  // }

  await Hive.openBox(boxName);
  // await Hive.openBox<User>("user_box");

  // await Firebase.initializeApp();
  // setupNotification();
  configureDependencies();

  initializeDateFormatting().then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widgets is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
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
