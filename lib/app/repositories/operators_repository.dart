import 'package:latest_payplus_agent/app/api_providers/api_manager.dart';
import 'package:latest_payplus_agent/app/api_providers/api_url.dart';
import 'package:latest_payplus_agent/app/models/operator_model.dart';

class OperatorRepository {
  Future<List<OperatorModel>> getOperators() async {
    APIManager _manager = APIManager();
    final response = await _manager.get(ApiClient.operators);

    print('operators number: ${response}');

    return List.from(response.map((item) => OperatorModel.fromJson(item)));
  }
}
