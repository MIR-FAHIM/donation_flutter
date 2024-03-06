import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/api_providers/api_manager.dart';
import 'package:latest_payplus_agent/app/api_providers/api_url.dart';
import 'package:latest_payplus_agent/app/models/bank_model.dart';
import 'package:latest_payplus_agent/app/models/user_bank_information_model.dart';
import 'package:latest_payplus_agent/app/services/auth_service.dart';

class BankInfoRepository {
  Future<List<BankModel>> getBankList() async {
    APIManager _manager = APIManager();
    final response = await _manager.get(ApiClient.bankList + '1');

    print('bank list: ${response}');
    return List.from(response.map((item) => BankModel.fromJson(item)));
  }
  Future deleteBankInfo(String accId) async {
    String token = Get.find<AuthService>().currentUser.value.token!;
    APIManager _manager = APIManager();
    print(token);
    // --form 'account_id="29"' \
    // --form 'acc_name=""' \
    // --form 'acc_no="01743911996"' \
    // --form 'routing_no=""
    Map bankData = {
      'account_id': accId,
    };

    var headers = {'token': token};

    final response = await _manager.postAPICallWithHeader(ApiClient.deleteBankInfo, bankData, headers);

    print('bank save: ${response}');
    return response;
  }
  Future editBankInfo(String bankId, String accountName, String accounNo, String routingNo) async {
    String token = Get.find<AuthService>().currentUser.value.token!;
    APIManager _manager = APIManager();
    print(token);
    // --form 'account_id="29"' \
    // --form 'acc_name=""' \
    // --form 'acc_no="01743911996"' \
    // --form 'routing_no=""
    Map bankData = {
      'account_id': bankId,
      'acc_name': accountName ?? '',
      'acc_no': accounNo,
      'routing_no': routingNo ?? '',
      'remark': "Agent"
    };

    var headers = {'token': token};

    final response = await _manager.postAPICallWithHeader(ApiClient.updateBankInfo, bankData, headers);

    print('bank updaTE: ${response}');
    return response;
  }
  Future saveBankInfo(String bankId, String accountName, String accounNo,
      String routingNo) async {
    String token = Get.find<AuthService>().currentUser.value.token!;

    print(token);

    Map bankData = {
      'bank_id': bankId,
      'acc_name': accountName,
      'acc_no': accounNo,
      'routing_no': routingNo,
      'remark': 'Agent'
    };

    var headers = {'token': token};
    APIManager _manager = APIManager();
    final response = await _manager.postAPICallWithHeader(
        ApiClient.bankInfoSave, bankData, headers);

    print('bank save: ${response}');
    return response;
  }

  Future<List<UserBankInformationModel>> getBankInfo() async {
    String token = Get.find<AuthService>().currentUser.value.token!;

    print(token);

    Map bankData = {
      'bank_id': 'all',
    };

    var headers = {'token': token};
    APIManager _manager = APIManager();
    final response = await _manager.postAPICallWithHeader(
        ApiClient.getBankInformation, bankData, headers);

    print('bank info: ${response}');
    return List.from(
        response.map((item) => UserBankInformationModel.fromJson(item)));
  }
}
