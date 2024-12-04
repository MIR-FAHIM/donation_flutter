import 'dart:convert';

import 'package:donation_flutter/app/api_providers/api_manager.dart';
import 'package:donation_flutter/app/api_providers/api_url.dart';
import 'package:donation_flutter/app/model/login_model.dart';
import 'package:donation_flutter/app/services/auth_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;


class HomeRepository {






  Future getDonationProjectList() async {
    APIManager _manager = APIManager();
    final response = await _manager.get(ApiClient.getDonationProjectList);

    print('home rep: ${response}');
    return response;
  }

  Future getReview(id) async {
    APIManager _manager = APIManager();
    final response = await _manager.get("${ApiClient.getReview}?project_id=$id");

    print('home rep: ${response}');
    return response;
  }

  Future getActivity(id) async {
    APIManager _manager = APIManager();
    final response = await _manager.get("${ApiClient.getActivity}?project_id=$id");

    print('activity rep: ${response}');
    return response;
  }

  Future getBank(id) async {
    APIManager _manager = APIManager();
    final response = await _manager.get("${ApiClient.getProBank}?project_id=$id");

    print('activity rep: ${response}');
    return response;
  }
  Future getUserDonationList() async {
    APIManager _manager = APIManager();
    final response = await _manager.get(ApiClient.getDonationProjectList);

    print('home rep: ${response}');
    return response;
  }

  Future getUserDonationListById(id) async {
    APIManager _manager = APIManager();
    final response = await _manager.get("${ApiClient.getAllDonationByUserId}?user_id=$id");

    print('donation rep: ${response}');
    return response;
  }
  Future getAllUser() async {
    APIManager _manager = APIManager();
    final response = await _manager.get(ApiClient.getAllUser);

    print('all user rep: ${response}');
    return response;
  }

  Future getProjectAmount(id) async {
    APIManager _manager = APIManager();
    final response = await _manager.get("${ApiClient.getProjectAmount}?project_id=$id");

    print('project amount: ${response}');
    return response;
  }

  Future getProjectImages(id) async {
    APIManager _manager = APIManager();
    final response = await _manager.get("${ApiClient.getProjectImages}?project_id=$id");

    print('all project images rep: ${response}');
    return response;
  }

  Future getAllDonations() async {
    APIManager _manager = APIManager();
    final response = await _manager.get(ApiClient.getAllDonation);

    print('all donations rep: ${response}');
    return response;
  }

  Future getDonationByProId(id) async {
    APIManager _manager = APIManager();
    final response = await _manager.get("${ApiClient.getDonationListByProject}?project_id=$id");

    print('all donations rep: ${response}');
    return response;
  }
  Future changeDonateAmount(Map data) async {


    APIManager _manager = APIManager();
    final response = await _manager.postAPICall(ApiClient.changeDonateAmountForUser, data);

    print('change amount: ${response}');

    return response;
  }

  Future addActivity(Map data) async {


    APIManager _manager = APIManager();
    final response = await _manager.postAPICall(ApiClient.addActivity, data);

    print('add activity: ${response}');

    return response;
  }

  Future addBank(Map data) async {


    APIManager _manager = APIManager();
    final response = await _manager.postAPICall(ApiClient.addBank, data);

    print('add bank: ${response}');

    return response;
  }

  Future addDonationByUser(Map data) async {


    APIManager _manager = APIManager();
    final response = await _manager.postAPICall(ApiClient.addTransactionByUser, data);

    print('add transaction: ${response}');

    return response;
  }

  Future addReview(Map data) async {


    APIManager _manager = APIManager();
    final response = await _manager.postAPICall(ApiClient.addReview, data);

    print('add review: ${response}');

    return response;
  }
  Future updateAmountAndTrsStatus(Map data) async {


    APIManager _manager = APIManager();
    final response = await _manager.postAPICall(ApiClient.updateAmountAndTrsStatus, data);

    print('update amount and status transaction: ${response}');

    return response;
  }

}
