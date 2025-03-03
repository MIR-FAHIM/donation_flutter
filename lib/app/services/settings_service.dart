import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:uni_links/uni_links.dart';

import '../../common/ui.dart';

import 'translation_service.dart';

class SettingsService extends GetxService {
  late GetStorage _box;
  StreamSubscription<String?>? _sub;
  SettingsService() {
    _box = GetStorage();
    initUniLinks();
  }

  ThemeData getLightTheme() {
    // TODO change font dynamically
    return ThemeData(
        primaryColor: const Color(0xFF652981),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            elevation: 0, foregroundColor: Color(0xFF652981)),
        scaffoldBackgroundColor: Colors.white,
        brightness: Brightness.light,
        dividerColor: Colors.grey.shade800,
        focusColor: const Color(0xFF652981),
        hintColor: Colors.grey,
        splashColor: Colors.grey.shade200,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
        colorScheme: const ColorScheme.light(
            primary: Color(0xFF652981), secondary: Color(0xFF652981)),
        textTheme: const TextTheme(
          headline6: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w700,
              color: Color(0xFF652981),
              height: 1.3),
          headline5: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
              color: Colors.black,
              height: 1.3),
          headline4: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
              color: Colors.black,
              height: 1.3),
          headline3: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
              color: Colors.black,
              height: 1.3),
          headline2: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w700,
              color: Color(0xFF652981),
              height: 1.4),
          headline1: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w300,
              color: Colors.black,
              height: 1.4),
          subtitle2: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              height: 1.2),
          subtitle1: TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.w400,
              color: Color(0xFF652981),
              height: 1.2),
          bodyText2: TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              height: 1.2),
          bodyText1: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: Colors.black,
              height: 1.2),
          caption: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w300,
              color: Color(0xFF652981),
              height: 1.2),
        ));
  }

  ThemeMode getThemeMode() {
    String? _themeMode = GetStorage().read<String>('theme_mode');
    switch (_themeMode) {
      case 'ThemeMode.light':
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle.light
              .copyWith(systemNavigationBarColor: Colors.white),
        );
        return ThemeMode.light;
      case 'ThemeMode.dark':
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle.dark
              .copyWith(systemNavigationBarColor: Colors.black87),
        );
        return ThemeMode.dark;
      default:
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle.light
              .copyWith(systemNavigationBarColor: Colors.white),
        );
        return ThemeMode.light;
    }
  }

  void handleDeepLink(String url) {
    print("Received deep link: $url");
    // Navigate to the specific page or perform any action based on the link
  }

  Future<void> initUniLinks() async {
    print("init uni link is started");
    try {
      final initialLink = await getInitialLink();
      if (initialLink != null) {
        handleDeepLink(initialLink);
      }
    } on PlatformException {
      // Handle exception
    }

    _sub = linkStream.listen((String? link) {
      if (link != null) {
        handleDeepLink(link);
      }
    }, onError: (err) {
      // Handle error
    });
  }

  Locale getLocale() {
    String? _locale = GetStorage().read<String>('language');
    print(_locale);
    if (_locale == null || _locale.isEmpty) {
      _locale = 'bn_BD';
    }
    return Get.find<TranslationService>().fromStringToLocale(_locale);
  }
}
