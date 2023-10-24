import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:latest_payplus_agent/app/models/daily_report_model.dart';
import 'package:latest_payplus_agent/app/repositories/daily_report.dart';

class DailyReportController extends GetxController {
  //TODO: Implement DailyReportController

  final count = 0.obs;
  final monthSelection =0.obs;
  final daySelection = 0.obs;
  final dailyReport = [].obs;
  final   dropdownValue = "".obs;
  final yearSelection = 0.obs;
  final dailyReportDetails = DailyReportModel().obs;
  final dailyReportLoaded = false.obs;
  final List<String> yearList = <String>[
    DateTime.now().year.toString(),
    DateTime(DateTime.now().year - 1).toString().substring(0, 4),
    DateTime(DateTime.now().year - 2).toString().substring(0, 4)
  ].obs;
  final List<String> tabs = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ].obs;
  final List<int> dayTab = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31
  ].obs;
  var now = new DateTime.now();

  @override
  Future<void> onInit() async {
    await getDailyReport();
    monthSelection.value = int.parse(DateTime.now().toString().substring(5, 7));
    daySelection.value = int.parse(DateTime.now().toString().substring(8, 10));
     yearSelection.value = int.parse(DateTime.now().toString().substring(0, 4));
     dropdownValue.value = DateTime.now().year.toString();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  getDailyReport({DateTime? date}) async {
    var formatter = new DateFormat('yyyy-MM-dd');
    String todayDate = formatter.format(now);

    DailyReportRepo().getDailyReports(todayDate).then((resp) {
      print("daily report");
      print(resp);

      dailyReportDetails.value = resp;
      dailyReport.value = [
        {
          'title': 'Opening Balance'.tr,
          'image': 'assets/images/Opening_Balance.png',
          'balance': dailyReportDetails.value.opening_balance,
        },
        {
          'title': 'Received Amount'.tr,
          'image': 'assets/images/hand.png',
          'balance': dailyReportDetails.value.receive_balance
        },
        {
          'title': 'Online Received Amount'.tr,
          'image': 'assets/images/online_recived_amount.png',
          'balance': dailyReportDetails.value.online_receive_balance
        },
        {
          'title': 'Total Recharge'.tr,
          'image': 'assets/images/Total_Recharge.png',
          'balance': dailyReportDetails.value.recharge_amount
        },
        {
          'title': 'Commission'.tr,
          'image': 'assets/images/commission.png',
          'balance': dailyReportDetails.value.commission
        },
        {
          'title': 'Bill Pay Amount'.tr,
          'image': 'assets/images/bill_pay.png',
          'balance': dailyReportDetails.value.bill_pay_amount
        },
        {
          'title': 'Bill Pay Commission'.tr,
          'image': 'assets/images/bill+pay_commision.png',
          'balance': dailyReportDetails.value.bill_pay_commission
        },
        {
          'title': 'CashBack'.tr,
          'image': 'assets/images/OTF.png',
          'balance': dailyReportDetails.value.otf
        },
        {
          'title': 'Daily Charge'.tr,
          'image': 'assets/images/Daily_Charge.png',
          'balance': dailyReportDetails.value.daily_charge
        },
        {
          'title': 'Closing Balance'.tr,
          'image': 'assets/images/Closing_Balance.png',
          'balance': dailyReportDetails.value.closing_balance
        },
        {
          'title': 'Package Purchase'.tr,
          'image': 'assets/images/Closing_Balance.png',
          'balance': dailyReportDetails.value.packagePurchase
        },
        {
          'title': 'Ticket Purchase'.tr,
          'image': 'assets/images/Closing_Balance.png',
          'balance': dailyReportDetails.value.ticketPurchase
        },
      ];

      dailyReportLoaded.value = true;
    });
  }
}
