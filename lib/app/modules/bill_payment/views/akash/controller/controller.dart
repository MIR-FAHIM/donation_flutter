import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:latest_payplus_agent/app/services/auth_service.dart';

class AkashBillPaymentController extends GetxController {
  //TODO: Implement BillPaymentController


  final subscription_id = ''.obs;
  final amount = 0.0.obs;

  final billpayLoaded = false.obs;
  final isChecked = false.obs;
  @override
  void onInit() {


    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}



  akashPayment(subsID, amount) async {
    print("aksh called");
    Map data = {
      'subscriber_id': subsID,
      'amount': amount,
    };

    String token = Get.find<AuthService>().currentUser.value.token!;

    // var headers = {'token': token};
    var headers = {'token': "FixedTokenForPGWUsingAsCredentialsCanNotBeChanged"};

    var url = 'https://shl.com.bd/api/appapi/agent-app/tv/bill/akash/confirm-subscription-payment';

    // var body = json.encode(data);

    var response = await http.post(Uri.parse(url), headers: headers, body: data);

    var resp = json.decode(response.body);
    print("aksh called $resp");
    billpayLoaded.value = true;
  }
}
