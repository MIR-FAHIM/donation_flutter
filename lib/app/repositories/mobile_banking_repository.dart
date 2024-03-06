import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/api_providers/api_manager.dart';
import 'package:latest_payplus_agent/app/api_providers/api_url.dart';
import 'package:latest_payplus_agent/app/models/mobile_bank_tran_history.dart';
import 'package:latest_payplus_agent/app/services/auth_service.dart';

class MobileBankingRepository {
  Future submitCashIn(
      {String? number, String? amount, String? pin, String? gateWayID}) async {
    String token = Get.find<AuthService>().currentUser.value.token!;

    Map body = {
      'number': number,
      'amount': amount,
      'pin': pin,
      "gateway_id" : gateWayID,
    };

    var headers = {'token': token};
    APIManager _manager = APIManager();
    final response = await _manager.postAPICallWithHeader( ApiClient.cashin, body, headers);

    print('cashin: ${response}');

    return response;
  }

  Future submitCashOut({String? number, String? amount, String? pin, String? gateWayID, String? otp}) async {
    String token = Get.find<AuthService>().currentUser.value.token!;

    Map body = {
      'number': number,
      'amount': amount,
      'pin': pin,
      "gateway_id" : gateWayID,
      "otp" : otp
    };

    var headers = {'token': token};
    APIManager _manager = APIManager();
    final response = await _manager.postAPICallWithHeader(ApiClient.cashout, body, headers);

    print('cashout: ${response}');

    return response;
  }
  Future submitRocketCashOut({String? number, String? amount, String? pin, String? gateWayID,}) async {
    String token = Get.find<AuthService>().currentUser.value.token!;

    Map body = {
      'number': number,
      'amount': amount,
      'pin': pin,
      "gateway_id" : gateWayID,
    };

    var headers = {'token': token};
    APIManager _manager = APIManager();
    final response = await _manager.postAPICallWithHeader(ApiClient.cashout, body, headers);

    print('cashout: ${response}');

    return response;
  }
  Future moneyTransfer(String number, String amount, String gatewayID, String pin) async {
    String token = Get.find<AuthService>().currentUser.value.token!;

    Map body = {
      'number': number,
      'amount': amount,
      "gateway_id": gatewayID,
      "pin": pin,
    };

    var headers = {'token': token};
    APIManager _manager = APIManager();
    final response = await _manager.postAPICallWithHeader(ApiClient.moneyTransfer, body, headers);

    print('money transfer: ${response}');

    return response;
  }

  Future<MobileBankTransactionHistoryModel> getMobileBankHistory() async {
    String token = Get.find<AuthService>().currentUser.value.token!;

    var headers = {'token': token};
    APIManager _manager = APIManager();
    final response = await _manager.postAPICallWithHeader(ApiClient.mobilebankHistory, {}, headers);

    print('mobile bank history: ${response}');

    return MobileBankTransactionHistoryModel.fromJson(response);
  }
}
