



import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:latest_payplus_agent/app/modules/settings/controllers/language_controller.dart';
import 'package:latest_payplus_agent/app/modules/settings/controllers/settings_controller.dart';
import 'package:latest_payplus_agent/app/services/auth_service.dart';
import 'package:latest_payplus_agent/app/services/firebase_messaging_service.dart';
import 'package:latest_payplus_agent/app/services/location_service.dart';
import 'package:latest_payplus_agent/app/services/settings_service.dart';
import 'package:latest_payplus_agent/app/services/translation_service.dart';
import 'package:latest_payplus_agent/service/shared_pref.dart';

import 'app/modules/Auth/signup/controllers/signup_controller.dart';
import 'app/routes/app_pages.dart';




class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
String type = '';

Future<void> backgroundHander(RemoteMessage message) async {
  if (message.data.isNotEmpty) {
    type = message.data['notification_type'] != '' && message.data['notification_type'] != null ? message.data['notification_type'].toString() : message.data['notification_sub_type'].toString();
    print('backgroundHander 4:${message.data['notification_type']}');
  }
}

///remove
const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    // 'This channel is used for important notifications.', // description
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

///remove

initServices() async {
  Get.lazyPut<SignupController>(
        () => SignupController(),
  );
  Get.log('starting services ...');
  await GetStorage.init();

  await Firebase.initializeApp();


  await Permission.notification.status.then((value) {

  //ios  Permission.accessNotificationPolicy;
    if (value.isGranted) {
      print("hlw fahim 111 _______________________ notification request ");


    } else {
      print("hlw fahim 222_______________________ notification request ");

      Permission.notification.request();
    }
  });
  ///remove
  // await flutterLocalNotificationsPlugin
  //     .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
  //     ?.createNotificationChannel(channel);

  ///remove
  ///
  await Get.putAsync<SettingsService>(() async => SettingsService());
  await Get.putAsync<SettingsController>(() async => SettingsController());
  await Get.putAsync<LanguageController>(() async => LanguageController());
  await Get.putAsync<AuthService>(() async => AuthService());
  await Get.putAsync(() => TranslationService().init());

  await Get.putAsync<LocationService>(() async => LocationService());
  FirebaseMessaging.onBackgroundMessage(backgroundHander);
  await Get.putAsync(() => FireBaseMessagingService().init());

  // NotificationLocal.initialize(flutterLocalNotificationsPlugin);
  Get.log('All services started...');
}

void main() async {
  HttpOverrides.global = new MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreff.to.initial();
  await initServices();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 800),
      title: "PayPlus Agent",
      theme: ThemeData(
        primarySwatch: Colors.purple,
        primaryColor: const Color(0xFF652981),
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: Get.find<TranslationService>().supportedLocales(),
      translationsKeys: Get.find<TranslationService>().translations,
      locale: Get.find<SettingsService>().getLocale(),
      fallbackLocale: Get.find<TranslationService>().fallbackLocale,
    ),
  );
}

///    <uses-permission android:name="android.permission.CALL_PHONE" />
///     <uses-permission android:name="android.permission.READ_PHONE_NUMBERS" />
