import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/models/all_notification_model.dart';
import 'package:latest_payplus_agent/app/models/all_notification_model.dart';
import 'package:latest_payplus_agent/app/models/notification_model.dart';
import 'package:latest_payplus_agent/app/models/transaction_report_model.dart';
import 'package:latest_payplus_agent/app/models/transaction_type_model.dart';
import 'package:latest_payplus_agent/app/modules/inbox/widgets/notification_widget.dart';
import 'package:latest_payplus_agent/app/modules/inbox/widgets/transactions_widget.dart';
import 'package:latest_payplus_agent/app/repositories/notification_repository.dart';

class TransactionController extends GetxController {
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

  final pages = [NotificationWidget(), TransactionsWidget()].obs;
  @override
  Future<void> onInit() async {

    await getTransactionReport();
    super.onInit();
  }





  getTransactionTypes() async {
    transactionLoaded.value = false;
    NotificationRepository().gettransactionType().then((resp) {
      transactionType.value = resp;
      transactionLoaded.value = true;
    });
  }

  List<String?> extractNumbersFromString(String input) {
    RegExp regExp = RegExp(r'\d+');
    return regExp.allMatches(input).map((match) => match.group(0)).toList();
  }

  getTransactionReport(
      {String type = '0', String from = '0', String to = '0'}) async {
    transactionReportLoaded.value = false;
    NotificationRepository()
        .gettransactionReport(type: type, from: from, to: to)
        .then((resp) {
      transactionReport.value = resp;
      print('tesssssssssssss : $resp');
      transactionReportLoaded.value = true;
    });
  }
}
