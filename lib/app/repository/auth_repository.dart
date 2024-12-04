import 'dart:convert';

import 'package:donation_flutter/app/api_providers/api_manager.dart';
import 'package:donation_flutter/app/api_providers/api_url.dart';
import 'package:donation_flutter/app/model/login_model.dart';
import 'package:donation_flutter/app/services/auth_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;


class AuthRepository {
  final userdata = GetStorage();





  ///User login api call
  Future<LoginModel> userLogin(String phoneNumber, String pass, ) async {
    Map _loginData = {'email': phoneNumber, 'password': '$pass',};

    APIManager _manager = APIManager();
    final response = await _manager.postAPICall(ApiClient.login, _loginData);

    print('user login: ${response}');
    if (response['result'] == 'success') {
      Get.find<AuthService>().setUser(LoginModel.fromJson(response));
    }
    return LoginModel.fromJson(response);
  }
  Future userRegister(Map data) async {


    APIManager _manager = APIManager();
    final response = await _manager.postAPICall(ApiClient.register, data);

    print('user register: ${response}');
    if (response['result'] == 'success') {
      Get.find<AuthService>().setUser(LoginModel.fromJson(response));
    }
    return response;
  }


}
