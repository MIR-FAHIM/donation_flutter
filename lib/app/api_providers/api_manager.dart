import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:latest_payplus_agent/app/api_providers/customExceptions.dart';

class APIManager {
  Future<dynamic> postAPICallWithHeader(String url, var param, Map<String, String> headerData) async {
    print("Calling API: $url");
    print("Calling parameters: $param");
    //headerData["remark"] = "Agent";

    print("Calling header: $headerData");

    var responseJson;
    try {
      final response = await http.post(Uri.parse(url), body: param, headers: headerData);
      responseJson = _response(response);
      print("response from api manager $responseJson");
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } catch(e) {
      print("all error is $e");
    }
    return responseJson;
  }

  Future<dynamic> postAPICallHeader(String url, Map<String, String> headerData) async {
    print("Calling API: $url");
    headerData["remark"] = "Agent";
    print("Calling header: $headerData");

    var responseJson;
    try {
      final response = await http.post(Uri.parse(url), headers: headerData);
      print("$response");
      responseJson = _response(response);
      print(responseJson);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> postAPICallWithOutHeader(String url) async {
    print("Calling API: $url");
    Map<String, String> headerData = {};
    headerData["remark"] = "Agent";
    print("Calling header: $headerData");
    var responseJson;
    try {
      final response = await http.post(Uri.parse(url), headers: headerData);
      responseJson = _response(response);
      print(responseJson);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> postAPICall(String url, Map param) async {
    print("Calling API: $url");
    print("Calling parameters: $param");
    Map<String, String> headerData = {};
    headerData["remark"] = "Agent";
    print("Calling header: $headerData");
    var responseJson;
    try {
      final response = await http.post(Uri.parse(url), body: param, headers: headerData);
      responseJson = _response(response);
      print(responseJson);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> multipartPostAPI(String url, Map<String, String> param, List images, String imageName, Map<String, String> headerData) async {
    print("Calling API: $url");
    print("Calling parameters: $param");
    headerData["remark"] = "Agent";
    print("Calling header: $headerData");
    print(images);

    var responseJson;
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields.addAll(param);

      print('fgdf');

      if (images.isNotEmpty) {
        for (var item in images) {
          String fileName = item.path.split("/").last;
          var stream = http.ByteStream(item.openRead());

          stream.cast();

          print(stream);
          // get file length

          var length = await item.length(); //imageFile is your image file

          // multipart that takes file
          var multipartFileSign = http.MultipartFile(imageName, stream, length, filename: fileName);

          request.files.add(multipartFileSign);
        }
      }
      request.headers.addAll(headerData);
      print('fngdfkngdf');
      http.StreamedResponse streamedResponse = await request.send();

      var response = await http.Response.fromStream(streamedResponse);

      print(response.statusCode);
      responseJson = _response(response);
      print(responseJson);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> get(String url) async {
    print("Calling API: $url");
    Map<String, String> headerData = {};
    headerData["remark"] = "Agent";
    print("Calling header: $headerData");
    var responseJson;
    try {
      final response = await http.get(Uri.parse(url), headers: headerData);
      print(response.body);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> getWithHeader(String url, Map<String, String> headerData) async {
    print("Calling API: $url");
    headerData["remark"] = "Agent";
    print('token: $headerData');
    var responseJson;
    try {
      final response = await http.get(Uri.parse(url), headers: headerData);
      print(response.body);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    print(response);
    print(response.statusCode);
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException('Error occurred while communicating with Server with StatusCode: ${response.statusCode}');
    }
  }
}
