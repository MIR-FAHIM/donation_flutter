import 'package:latest_payplus_agent/app/api_providers/api_manager.dart';
import 'package:latest_payplus_agent/app/api_providers/api_url.dart';
import 'package:latest_payplus_agent/app/models/hotline_model.dart';

class HotLineRepo {
  Future getHotline() async {
    APIManager _manager = APIManager();
    final response = await _manager.get(ApiClient.hotline);

    print('operators number: ${response}');

    return HotLineModel.fromJson(response);
  }
}
