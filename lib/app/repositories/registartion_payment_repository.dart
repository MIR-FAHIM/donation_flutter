import 'package:latest_payplus_agent/app/api_providers/api_manager.dart';
import 'package:latest_payplus_agent/app/api_providers/api_url.dart';
import 'package:latest_payplus_agent/app/models/registration_payment_info_model.dart';

class RegistartionPaymentRepository {
  Future<RegistrationPaymentInformationModel> RegPaymentInfo(
      String mobileNumber, String serviceFeeID) async {
    print('RegistartionPaymentRepository.RegPaymentInfo: $serviceFeeID');
    Map number = {'number': '$mobileNumber', 'service_fee_type_id': serviceFeeID};

    APIManager _manager = APIManager();
    final response =
        await _manager.postAPICall(ApiClient.registartionPaymentinfo, number);

    print('user 2: ${response}');
    return RegistrationPaymentInformationModel.fromJson(response);
  }

  Future getPaymentCollectionUrl(
    String phone,
    String amount,
    String id,
  ) async {
    // String token = Get.find<AuthService>().currentUser.value.token!;

    Map paymentCollectionData = {'number': phone, 'payment_amount': amount, 'id': id};

    // var headers = {'token': token};
    APIManager _manager = APIManager();
    final response =
        await _manager.postAPICall(ApiClient.regPaymentUrl, paymentCollectionData);

    print('payment collection url: ${response}');
    return response;
  }
}
