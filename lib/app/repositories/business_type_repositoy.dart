import 'package:latest_payplus_agent/app/api_providers/api_manager.dart';
import 'package:latest_payplus_agent/app/api_providers/api_url.dart';
import 'package:latest_payplus_agent/app/models/businessTypeModel.dart';

class BusinessTypeRepository {
  Future<List<BusinessTypeModel>> getBusinessType() async {
    print("hlw bro businesss type ");
    //'sgPTbDLPpCNUcs3BYUg3Gmk8MOiMcGB3tSiEFcDd'
    var headers = {'token': 'sgPTbDLPpCNUcs3BYUg3Gmk8MOiMcGB3tSiEFcDd'};
    APIManager _manager = APIManager();
    final response = await _manager.postAPICallWithHeader(
        ApiClient.businessType, {}, headers);

    print('user number: ${response}');

    return List.from(response.map((item) => BusinessTypeModel.fromJson(item)));
  }
}
