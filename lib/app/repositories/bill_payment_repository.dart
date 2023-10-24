import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:latest_payplus_agent/app/api_providers/api_manager.dart';
import 'package:latest_payplus_agent/app/api_providers/api_url.dart';
import 'package:latest_payplus_agent/app/models/favourite_bill_list_model.dart';

import '../services/auth_service.dart';

class BillPaymentRepository {
  Future<FavouriteListModel> getFavBillList() async {
    // String token = Get.find<AuthService>().currentUser.value.token!;

    var headers = {'token': Get.find<AuthService>().currentUser.value.token!};

    APIManager _manager = APIManager();
    final response =
        await _manager.postAPICallHeader(ApiClient.favouriteBiller, headers);

    print('Favourite Biller: ${response}');
    return FavouriteListModel.fromJson(response);
  }

  Future<dynamic> deleteFavBiller() async {
    // String token = Get.find<AuthService>().currentUser.value.token!;

    var headers = {'token': Get.find<AuthService>().currentUser.value.token!};

    APIManager _manager = APIManager();
    final response = await _manager.postAPICallHeader(
        ApiClient.deleteFavouriteBiller, headers);

    print('Delete Biller: ${response}');
    return response;
  }

  Future<dynamic> deleteFavBillerTemp(String id) async {
    String token = Get.find<AuthService>().currentUser.value.token!;

    var headers = {'token': token};

    // var headers = {'token': 'IMBkVG1UFCE8VABPg5TI14yY44StEfWqF341OAlh'};
    Map data = {'saved_bill_id': id};

    var url = 'https://shl.com.bd/api/appapi/billpay/remove-favourite-biller';

    var response =
        await http.post(Uri.parse(url), headers: headers, body: data);
    var resp = json.decode(response.body);

    print('Delete Biller: ${resp}');
    return resp;
  }

  Future<FavouriteListModel> getFavBill() async {
    String token = Get.find<AuthService>().currentUser.value.token!;

    // var headers = {'token': 'IMBkVG1UFCE8VABPg5TI14yY44StEfWqF341OAlh'};

    var headers = {'token': token};

    var url = 'https://shl.com.bd/api/appapi/billpay/get-favourite-biller';

    var response = await http.post(Uri.parse(url), headers: headers);
    var resp = json.decode(response.body);

    print('Bill Charge : $resp');

    return FavouriteListModel.fromJson(resp);
  }
}
