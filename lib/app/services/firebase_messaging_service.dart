import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/modules/add_balance/controllers/add_balance_controller.dart';
import 'package:latest_payplus_agent/app/modules/inbox/controllers/inbox_controller.dart';
import 'package:latest_payplus_agent/app/modules/payment_collection/controllers/payment_collection_controller.dart';
import 'package:latest_payplus_agent/app/modules/recharge_report/controllers/recharge_report_controller.dart';

import 'package:latest_payplus_agent/app/routes/app_pages.dart';
import 'package:latest_payplus_agent/app/services/notificationlocal.dart';
import 'package:latest_payplus_agent/main.dart';
import '../../common/ui.dart';
import '../modules/Auth/login/controllers/login_controller.dart';

class FireBaseMessagingService extends GetxService {
  late List<String?> numbers;
  Future<FireBaseMessagingService> init() async {
    firebaseCloudMessagingListeners();
    // await flutterLocalNotificationsPlugin
    //     .resolvePlatformSpecificImplementation<
    //         AndroidFlutterLocalNotificationsPlugin>()
    //     ?.createNotificationChannel(channel);

    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@drawable/notification_icon');
    var initialzationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    flutterLocalNotificationsPlugin.initialize(initialzationSettings,
        onSelectNotification: onSelectNotification);

    return this;
  }

  AndroidNotificationChannel channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      // 'This channel is used for important notifications.', // description
      importance: Importance.high,
      playSound: true);

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void firebaseCloudMessagingListeners() {
    ///gives you the message on which user taps
    ///and it opened the app from terminated state
    FirebaseMessaging.instance.getInitialMessage().then((message) async {
      if (message != null) {
        RemoteNotification notification = message.notification!;
        type = message.data['notification_type'] != '' &&
                message.data['notification_type'] != null
            ? message.data['notification_type'].toString()
            : message.data['notification_sub_type'].toString();
        print(
            'FireBaseMessagingService.firebaseCloudMessagingListeners 1:${message.data['notification_type']}');

        // flutterLocalNotificationsPlugin.show(
        //     message.data.hashCode,
        //     notification.title!,
        //     notification.body!,
        //     NotificationDetails(
        //       android: AndroidNotificationDetails(
        //         channel.id,
        //         channel.name,
        //         // channel.description,
        //         // TODO add a proper drawable resource to android, for now using
        //         //      one that already exists in example app.
        //         // icon: message.notification!.android!.smallIcon,
        //       ),
        //     ));
        // if (type == '') {
        //   if (message.data.isNotEmpty) {
        //     if (message.data['notification_type'].toString() == '1') {
        //       Get.toNamed(Routes.OFFER, arguments: message.data['notification_type'].toString());
        //     }
        //     if (message.data['notification_type'].toString() == '2') {
        //       Get.toNamed(Routes.RECHARGE_REPORT, arguments: message.data['notification_type'].toString());
        //     }
        //     if (message.data['notification_type'].toString() == '3') {
        //       Get.toNamed(Routes.TRANSACTION_HISTORY, arguments: message.data['notification_type'].toString());
        //     }
        //   }
        // }
      }
    });

    FirebaseMessaging.instance
        .requestPermission(sound: true, badge: true, alert: true);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      RemoteNotification notification = message.notification!;
      print(notification.title!);

      print(
          'FireBaseMessagingService.firebaseCloudMessagingListeners:${message.data['notification_type']}');
      //new added
      // NotificationLocal.showBigTextNotification(title: notification.title!, body: "hlw",
      //     fln: flutterLocalNotificationsPlugin, payload:"3" );
      // new end

      // snackbar

      flutterLocalNotificationsPlugin.show(
        message.data.hashCode,
        notification.title!,
        notification.body!,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            // channel.description,
            // TODO add a proper drawable resource to android, for now using
            //      one that already exists in example app.
            // icon: message.notification!.android!.smallIcon,
          ),
        ),
        payload: notification.title!.contains("Robi Recharge")
            ? notification.body!
            : message.data['notification_type'].toString(),
      );
      Get.find<InboxController>().getNotifications();
      // print('get notificationbody is 1:${notification.body!}');
      // numbers = Get.find<RechargeController>().extractNumbersFromString(notification.body!);
      Get.find<InboxController>().getNewMsgNum();

      //In App Notification
      // Get.showSnackbar(Ui.notificationSnackBar(
      //   title: notification.title!,
      //   message: notification.body!,
      // ));

      // if (message.data.isNotEmpty) {
      //   print('FireBaseMessagingService.firebaseCloudMessagingListeners: ${message.data['notification_type'].runtimeType}');
      //   if (message.data['notification_type'].toString() == '1') {
      //     Get.put(RootController()).changePageOutRoot(1);
      //     Get.toNamed(Routes.Notification_View, arguments: message.data['notification_type'].toString());
      //   }
      //   if (message.data['notification_type'].toString() == '2') {
      //     Get.toNamed(Routes.RECHARGE_REPORT, arguments: message.data['notification_type'].toString());
      //   }
      //   if (message.data['notification_type'].toString() == '3') {
      //     Get.toNamed(Routes.COLLECTION, arguments: message.data['notification_type'].toString());
      //   }
      // }
    });
    print("hlw noti 66666666 ");
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      print("hlw noti 5555555 ");
      RemoteNotification notification = message.notification!;

      // Get.showSnackbar(Ui.notificationSnackBar(
      //   title: notification.title!,
      //   message: notification.body!,
      // ));
      print(
          'FireBaseMessagingService.firebaseCloudMessagingListeners 2:${message.data['notification_type']}');
      print("hlw noti 7777777 ");
      // flutterLocalNotificationsPlugin.show(
      //     message.data.hashCode,
      //     notification.title!,
      //     notification.body!,
      //     NotificationDetails(
      //       android: AndroidNotificationDetails(
      //         channel.id,
      //         channel.name,
      //         // channel.description,
      //         // TODO add a proper drawable resource to android, for now using
      //         //      one that already exists in example app.
      //         // icon: message.notification!.android!.smallIcon,
      //       ),
      //     ));
      print("hlw noti 1111111 ");
      Map data = {"msg": "hlw"};
      if (message.data.isNotEmpty) {
        Get.put(InboxController());
        Get.find<InboxController>().getNotifications();

        print("bro my push notification type is ${message.data['notification_type'].toString()}");
        print(
            'FireBaseMessagingService.firebaseCloudMessagingListeners my notification type is ++++++++ ${message.data['notification_type'].toString()} is bro ${message.messageType} +++++++++: ${message.data['notification_type'].runtimeType}');
        if (message.data['notification_type'].toString() == '1') {
          Get.put(AddbalanceController());
          Get.find<AddbalanceController>().getAddBalanceHistory();
          Get.toNamed(Routes.COLLECTION,
              arguments: message.data['notification_type'].toString());
        }

        if (message.data['notification_type'].toString() == '2') {

          Get.put(RechargeReportController());
          Get.find<RechargeReportController>().getRechargeReport();
          Get.toNamed(Routes.RECHARGE_REPORT,
              arguments: message.data['notification_type'].toString());
        }
        if (message.data['notification_type'].toString() == '3') {
          print("hlw noti 22222 ");
          Get.toNamed(Routes.COLLECTION,
              arguments: message.data['notification_type'].toString());
        }
        if (message.data['notification_type'].toString() == '4') {
          print("hlw noti 22222 ");
          Get.toNamed(Routes.COLLECTION,
              arguments: message.data['notification_type'].toString());
        }
        if (notification.title!
            .contains("Robi Recharge Request from PayPlus")) {
          // Get.find<RechargeController>().rechargeNumber.value =  numbers[1]!;
          // Get.find<RechargeController>().amount.value =  numbers[0]!;
          // Get.find<RechargeController>().commission.value =  numbers[2]!;
          print("image notification 111111++++++++++++++");
          Get.toNamed(Routes.RECHARGEPINNOTIFICATION,
              arguments: [notification.body, "mir"]);
        }
      } else {
        print("hlw noti 44444444 ");
        if (notification.title!.contains("Payment Notification")) {
          Get.toNamed(Routes.COLLECTION,
              arguments: message.data['notification_type'].toString());
        } else {
          print("image notification ++++++++++++++");
          // Get.toNamed(Routes.RECHARGEPINNOTIFICATION,
          //     arguments: [notification.body, "push"]);
          Get.put(InboxController());
          Get.find<InboxController>().getNotifications();
          Get.toNamed(
            Routes.Notification_View,
          );
        }
      }
    });
  }

  Future<void> setDeviceToken() async {
    Get.find<LoginController>().deviceToken.value =
        (await FirebaseMessaging.instance.getToken())!;
  }

  void onSelectNotification(String? payload) async {
    print("My Payload is $payload");
    // final NotificationAppLaunchDetails? notificationAppLaunchDetails =
    //     await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

    if (payload == "3") {
      Get.toNamed(Routes.COLLECTION);
    } else if (payload == "2") {
      Get.toNamed(
        Routes.RECHARGE_REPORT,
      );
    } else {
      print("my payload is $payload");
      Get.toNamed(
        Routes.Notification_View,
      );
    }

    // Map notificationModelMap = jsonDecode(payload!);
  }
}
