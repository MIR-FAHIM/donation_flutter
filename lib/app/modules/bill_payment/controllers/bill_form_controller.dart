import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/models/favourite_bill_list_model.dart';
import 'package:latest_payplus_agent/app/repositories/bill_payment_repository.dart';

class BillFormController extends GetxController {
  //TODO: Implement BillPaymentController

  final isChecked = false.obs;
  final refName = ''.obs;
  final bill_id = ''.obs;
  final meterNo = ''.obs;
  final amount = ''.obs;
  final accountID = ''.obs;
  final mobile = ''.obs;
  final favBillerLoaded = false.obs;
  final favBillList = FavouriteListModel().obs;
  var lstTask = List<dynamic>.empty(growable: true).obs;
  // final refName = ''.obs;

  @override
  void onInit() {
    getFavouriteBiller();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void refreshList() async {
    DeleteBiller();
  }

  getFavouriteBiller() async {
    favBillerLoaded.value = false;
    BillPaymentRepository().getFavBill().then((resp) {
      favBillList.value = resp;
      favBillerLoaded.value = true;
    });
  }

  DeleteBiller() async {
    BillPaymentRepository().deleteFavBillerTemp(bill_id.value).then((resp) {
      print(resp['result']);
      if (resp['result'] == 'success') {
        // favBillList.clear();
        getFavouriteBiller();
      } else {}
    });
  }
}
