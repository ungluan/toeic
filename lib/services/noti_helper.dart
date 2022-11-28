// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:rxdart/rxdart.dart';
// import 'package:toeic/main.dart';
//
// final BehaviorSubject<ReceivedNotification>
//     _didReceiveLocalNotificationSubject =
//     BehaviorSubject<ReceivedNotification>();
//
// final BehaviorSubject<String> selectNotificationSubject =
//     BehaviorSubject<String>();
//
// void dided(){
//   print("Heelo ");
// }
//
// void back(){
//   print("Heelo ");
// }
//
// Future<void> initNotifications(
//     FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
//   var initializationSettingsAndroid = const AndroidInitializationSettings('logo.png');
//
//   var initializationSettings =
//       InitializationSettings(android: initializationSettingsAndroid);
//   await flutterLocalNotificationsPlugin.initialize(
//     initializationSettings,
//     onDidReceiveBackgroundNotificationResponse: (notificationResponse) => notificationTapBackground(notificationResponse),
//     onDidReceiveNotificationResponse: notificationTapBackground,
//   );
// }
