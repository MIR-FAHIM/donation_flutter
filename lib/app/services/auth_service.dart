import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:latest_payplus_agent/app/models/customer_model.dart';

import 'settings_service.dart';

class AuthService extends GetxService {
  final currentUser = CustomerModel().obs;
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
    getUsed();
    getCurrentUser();
    super.onInit();
  }

  void setUser(CustomerModel customer) async {
    _box.write('current_user', customer.toJson());

    getCurrentUser();
  }

  void setFirstUseOrNot() async {
    _box.write('used', true);
    getUsed();
  }

  void setFirstLoggedOrNot() async {
    _box.write('alreadyLogged', true);
    getUsed();
  }

  getLogged() {
    if (_box.hasData('alreadyLogged')) {
      alreadyLogged.value = _box.read('alreadyLogged');
    }
  }

  Future getUsed() async {
    if (_box.hasData('used')) {
      used.value = await _box.read('used');
    }
  }

  Future getCurrentUser() async {
    if (_box.hasData('current_user')) {
      currentUser.value = CustomerModel.fromJson(await _box.read('current_user'));
    }
    print('customer data: ${currentUser.value.customerName}');
  }

  Future removeCurrentUser() async {
    currentUser.value = CustomerModel();
    await _box.remove('current_user');
  }

  bool get isAuth => currentUser.value.token == null ? false : true;
}
