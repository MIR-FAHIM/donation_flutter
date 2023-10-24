import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/models/all_notification_model.dart';
import 'package:latest_payplus_agent/app/models/all_notification_model.dart';
import 'package:latest_payplus_agent/app/models/notification_model.dart';
import 'package:latest_payplus_agent/app/models/transaction_report_model.dart';
import 'package:latest_payplus_agent/app/models/transaction_type_model.dart';
import 'package:latest_payplus_agent/app/modules/inbox/widgets/notification_widget.dart';
import 'package:latest_payplus_agent/app/modules/inbox/widgets/transactions_widget.dart';
import 'package:latest_payplus_agent/app/repositories/notification_repository.dart';

class InboxController extends GetxController {
  //TODO: Implement InboxController

  final selectedIndex = 0.obs;
  final notifications = NotificationModel().obs;
  final newNotificationNum = 0.obs;

  final allnotifications = AllNotificationModel().obs;
  final notificationLoaded = false.obs;

  final transactionType = <TransactionTypeModel>[].obs;
  final transactionLoaded = false.obs;

  final transactionReport = TransactionReportModel().obs;
  final transactionReportLoaded = false.obs;

  final selectedType = 0.obs;

  final pages = [NotificationWidget(), TransactionWidget()].obs;
  @override
  Future<void> onInit() async {
    getNotifications();
    // await getTransactionReport();
    super.onInit();
  }

  getNotifications() async {
    notificationLoaded.value = false;
    NotificationRepository().getNotifications().then((resp) {
      if (resp.result == 'success') {
        notifications.value = resp;
      }
      notificationLoaded.value = true;
    });
  }
  changeNotiStatus(noti) async {
    notificationLoaded.value = false;
    NotificationRepository().changeNotificationStatus(noti).then((resp) {
      if (resp['result'] == 'success') {
       print("status changed");
       getNotifications();
      }

    });
  }
  getallNotifications() async {
    notificationLoaded.value = false;
    NotificationRepository().getAllNotifications().then((resp) {
      if (resp.result == 'success') {
        allnotifications.value = resp;
      }
      notificationLoaded.value = true;
    });
  }

  getNewMsgNum(){

    newNotificationNum.value ++ ;
    print("msg number is ${newNotificationNum.value}");
  }
  removeNewMsgNum(){

    newNotificationNum.value = 0 ;
  }

  getTransactionTypes() async {
    transactionLoaded.value = false;
    NotificationRepository().gettransactionType().then((resp) {
      transactionType.value = resp;
      transactionLoaded.value = true;
    });
  }

  getTransactionReport({String type = '0', String from = '0', String to = '0'}) async {
    transactionReportLoaded.value = false;
    NotificationRepository().gettransactionReport(type: type, from: from, to: to).then((resp) {
      transactionReport.value = resp;
      print('tesssssssssssss : $resp');
      transactionReportLoaded.value = true;
    });
  }
}
