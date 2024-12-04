import 'package:donation_flutter/app/model/login_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


import 'settings_service.dart';

class AuthService extends GetxService {
  final currentUser = LoginModel().obs;
  late GetStorage _box;
  final used = false.obs;
  final alreadyLogged = false.obs;

  AuthService() {
    _box = GetStorage();
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    _box = GetStorage();
    getLogged();
    // getUsed();
     getCurrentUser();
    super.onInit();
  }

  void setUser(LoginModel customer) async {
    _box.write('current_user', customer.toJson());

    getCurrentUser();
  }

  void setFirstUseOrNot() async {
    _box.write('used', true);
    getUsed();
  }

  void setFirstLoggedOrNot() async {
    _box.write('alreadyLogged', true);
    print("i am here 123");
    getLogged();
  }

  getLogged() {
    if (_box.hasData('alreadyLogged')) {
      alreadyLogged.value = _box.read('alreadyLogged');
      print("already logged is ${alreadyLogged.value}");
    }
  }


  Future getUsed() async {
    if (_box.hasData('used')) {
      used.value = await _box.read('used');
    }
  }

  Future getCurrentUser() async {
    if (_box.hasData('current_user')) {
      currentUser.value = LoginModel.fromJson(await _box.read('current_user'));
    }
    print('customer data: ${currentUser.value.user!.name}');
  }

  Future removeCurrentUser() async {
    currentUser.value = LoginModel();
    await _box.remove('alreadyLogged');
    await _box.remove('current_user');
  }


}
