import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:new_version_plus/new_version_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:latest_payplus_agent/app/modules/home/views/home_view.dart';
import 'package:latest_payplus_agent/app/modules/inbox/views/inbox_view.dart';
import 'package:latest_payplus_agent/app/modules/offer/views/offer_view.dart';
import 'package:latest_payplus_agent/app/modules/package/controller/package_list_controller.dart';
import 'package:latest_payplus_agent/app/modules/payment_collection/views/payment_history_view.dart';
import 'package:latest_payplus_agent/app/repositories/appinfor_repo.dart';
import 'package:latest_payplus_agent/app/routes/app_pages.dart';
import 'package:latest_payplus_agent/app/services/auth_service.dart';
import 'package:latest_payplus_agent/app/services/notificationlocal.dart';
import 'package:latest_payplus_agent/common/ui.dart';
import 'package:latest_payplus_agent/main.dart';
import 'package:latest_payplus_agent/service/shared_pref.dart';
import 'package:url_launcher/url_launcher.dart';

class RootController extends GetxController {
  //TODO: Implement RootController
  final currentIndex = 0.obs;
  final notificationType = ''.obs;


  @override
  void onInit() {
    super.onInit();
    Get.lazyPut<PackageController>(
          () => PackageController(),
    );
    //
    if(Get.find<AuthService>().currentUser.value.kyc_status == "pending"){
      print("hlw 111111");
      NotificationLocal.showBigTextNotification(title: "KYC" , body: "আপনার NID ভেরীফিকেশন  চলছে ....!", fln: flutterLocalNotificationsPlugin);



    }
    advancedStatusCheck();
    loginDuration().then((e){
       int day = DateTime.parse(DateTime.now().toString()).difference(DateTime.parse(e)).inDays ;
       print("my day duration is ++++++++ $day");
      if(day > 15){

        String number = Get.find<AuthService>().currentUser.value.mobileNumber!;
        Get.find<AuthService>().removeCurrentUser();
        SharedPreff.to.prefss.remove("logindate");
        Get.offAndToNamed(Routes.LOGIN, arguments: number);

      }
    });
    notificationType.value = Get.arguments ?? '';
    getAppInformation();

  }

  @override
  void onReady() {
    super.onReady();
    print('HomeController.onReady:${notificationType.value}');
    switch (type) {
      case '1':
        currentIndex.value = 1;
        break;
      case '2':
        Get.toNamed(Routes.RECHARGE_REPORT, arguments: type);
        break;
      case '3':
        Get.toNamed(Routes.TRANSACTION_HISTORY, arguments: type);
        break;

      case '4':
        Get.to(PaymentHistoryView());
        break;
    }
  }

  @override
  void onClose() {}

  List<Widget> pages = [
    HomeView(),
    HomeView(),
    //OfferView(),
    InboxView(),
  ];

  Widget get currentPage => pages[currentIndex.value];
  getAppInformation() async {
    print("calling APp update ++++++++++++++");
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    AppInfoRepository().getAppinfo(packageInfo.version).then((response) async {
      print("working 111 ++++++++++++++");
      print("hlw response from app update +++++++++++++ $response");
      if (response[0]['update_required'].toString() == '1') {
        Ui.showAwesomeDialog('INFO', 'A new version is available.\nPlease update your app.', Colors.yellow.shade500, isBarrierDismiss: false, () async {
          if (!await launchUrl(
            Uri.parse('https://play.google.com/store/apps/details?id=paystation.com.bd'),
            mode: LaunchMode.externalNonBrowserApplication,
          )) {
            throw 'Could not launch ${Uri.parse('https://play.google.com/store/apps/details?id=paystation.com.bd')}';
          }
        });
      }
    }).catchError((onError) {
      print('error: $onError');
      //var response = json.decode(onError.toString());
      //ScaffoldMessenger.of(Get.context!).showSnackBar(Ui.errorAwesomeSnackBar(message: response['message'], title: 'Error'));

      throw (onError);
    });
  }
  loginDuration() async{
    String? date = await SharedPreff.to.prefss.getString("logindate");
    return date;
    //  print("login duration bro");
    // int day = DateTime.parse(DateTime.now().toString()).difference(DateTime.parse(date!)).inDays ;
    // print("my login duration $day");
  }

  advancedStatusCheck() async {
    print("hle broooooo");

    final newVersion = NewVersionPlus(
      //iOSId: 'com.google.Vespa',
      androidId: 'paystation.com.bd',
    );
    var status = await newVersion.getVersionStatus();
    print("version status ${status!.appStoreLink}");
    if (status.canUpdate == true) {
      print("update av");
      newVersion.showUpdateDialog(
        launchMode: LaunchMode.externalApplication,
        context: Get.context!,
        versionStatus: status,
        dialogTitle: 'Update Available!',
        dialogText:
        'Upgrade  ${status.localVersion} to ${status.storeVersion}',
      );
    }
  }
  Future<void> changePageOutRoot(int _index) async {
    currentIndex.value = _index;
    await Get.offNamedUntil(Routes.ROOT, (Route route) {
      if (route.settings.name == Routes.ROOT) {
        return true;
      }
      return false;
    }, arguments: _index);
  }

  void changePage(int page) {
    currentIndex.value = page;
  }
}
