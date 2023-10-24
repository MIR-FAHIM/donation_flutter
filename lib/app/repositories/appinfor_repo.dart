
import 'package:latest_payplus_agent/app/api_providers/api_manager.dart';
import 'package:latest_payplus_agent/app/api_providers/api_url.dart';

class AppInfoRepository {
  ///Get appinfo
  Future getAppinfo(String version) async {
    print('AppInfoRepository.getAppinfo:${version}');
    APIManager _manager = APIManager();
    final response = await _manager.get(
      '${ApiClient.appInfo}${version}',
    );
    print(response);
    return response;
  }
}
