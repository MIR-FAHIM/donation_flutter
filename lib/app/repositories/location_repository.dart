import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/api_providers/api_manager.dart';
import 'package:latest_payplus_agent/app/api_providers/api_url.dart';
import 'package:latest_payplus_agent/app/models/district_model.dart';
import 'package:latest_payplus_agent/app/models/divisionsTypeModel.dart';
import 'package:latest_payplus_agent/app/models/thana_model.dart';
import 'package:latest_payplus_agent/app/models/union_model.dart';
import 'package:latest_payplus_agent/app/services/auth_service.dart';

class LocationRepository {
  Future<List<DivisionModel>> getDivisions() async {
    String token = Get.find<AuthService>().currentUser.value.token!;

    print(token);

    Map location = {};

    var headers = {'token': token};
    APIManager _manager = APIManager();
    final response = await _manager.postAPICallWithHeader(
        ApiClient.divisionUrl, location, headers);

    print('division: ${response}');
    return List.from(response.map((item) => DivisionModel.fromJson(item)));
  }

  Future<List<DistrictModel>> getDistrict(String divisionId) async {
    String token = Get.find<AuthService>().currentUser.value.token!;

    print(token);

    Map location = {'division_id': divisionId};

    var headers = {'token': token};
    APIManager _manager = APIManager();
    final response = await _manager.postAPICallWithHeader(
        ApiClient.districtUrl, location, headers);

    print('district: ${response}');
    return List.from(response.map((item) => DistrictModel.fromJson(item)));
  }

  Future<List<ThanaModel>> getThana(String districtId) async {
    String token = Get.find<AuthService>().currentUser.value.token!;

    print(token);

    Map location = {'district_id': districtId};

    var headers = {'token': token};
    APIManager _manager = APIManager();
    final response = await _manager.postAPICallWithHeader(
        ApiClient.thanaUrl, location, headers);

    print('thana: ${response}');
    return List.from(response.map((item) => ThanaModel.fromJson(item)));
  }

  Future<List<UnionModel>> getUnion(String thanaId) async {
    String token = Get.find<AuthService>().currentUser.value.token!;

    print(token);

    Map location = {'upazilla_id': thanaId};

    var headers = {'token': token};
    APIManager _manager = APIManager();
    final response = await _manager.postAPICallWithHeader(
        ApiClient.unionUrl, location, headers);

    print('union: ${response}');
    return List.from(response.map((item) => UnionModel.fromJson(item)));
  }
}
