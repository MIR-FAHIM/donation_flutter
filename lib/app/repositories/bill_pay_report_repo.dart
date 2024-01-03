import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/api_providers/api_manager.dart';
import 'package:latest_payplus_agent/app/api_providers/api_url.dart';
import 'package:latest_payplus_agent/app/models/billDetails.dart';
import 'package:latest_payplus_agent/app/models/billpayhistorymodel.dart';
import 'package:latest_payplus_agent/app/services/auth_service.dart';

class BillPayReportRepo {
  Future<BillPayHistory> getBillHistory(
      {String? dateTo, String? dateFrom}) async {
    String token = Get.find<AuthService>().currentUser.value.token!;

    Map body = {'bill_type_id': '0', 'from': dateTo, 'to': dateFrom, 'search_key': '0'};

    var headers = {'token': token};
    APIManager _manager = APIManager();
    final response = await _manager.postAPICallWithHeader(ApiClient.billHistory, body, headers);

    print('daily report data: ${response}');

    return BillPayHistory.fromJson(response);
  }

  Future<BillPayDetails> getBillDetails(String id) async {
    String token = Get.find<AuthService>().currentUser.value.token!;

    Map body = {'id': id};

    var headers = {'token': token};
    APIManager _manager = APIManager();
    final response = await _manager.postAPICallWithHeader(ApiClient.billDetails, body, headers);

    print('daily report data: ${response}');

    return BillPayDetails.fromJson(response);
  }
}
