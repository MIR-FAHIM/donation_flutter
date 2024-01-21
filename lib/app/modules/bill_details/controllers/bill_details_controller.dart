import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/models/billDetails.dart';
import 'package:latest_payplus_agent/app/repositories/bill_pay_report_repo.dart';

class BillDetailsController extends GetxController {
  //TODO: Implement BillDetailsController

  final billId = ''.obs;
  final billDetails = BillPayDetails().obs;
  final billDetailsLoaded = false.obs;
  @override
  void onInit() {
    billId.value = Get.arguments;
    getBillDetails();
    super.onInit();
  }


  @override
  void onReady() {
    super.onReady();
  }

  getBillDetails() async {
    BillPayReportRepo().getBillDetails(billId.value).then((resp) {
      billDetails.value = resp;
      billDetailsLoaded.value = true;
    });
  }
}
