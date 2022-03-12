import 'package:future/utils/constants.dart';
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String baseUrl;
  late Map<String, String> _mainHeaders;

  ApiClient({required this.baseUrl}) {
    baseUrl = baseUrl;
    timeout = Duration(seconds: 30);
    token = Constants.TOKEN;
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };
  }

  void updateHeader(String token) {
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };
  }

  Future<Response> getMethod(String url) async {
    try {
      //does not need a complete url - just endpoint is needed
      Response response = await get(url, headers: _mainHeaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> getMethodWithToken(String url, String token) async {
    try {
      //does not need a complete url - just endpoint is needed
      Response response = await get(url,
          headers: _mainHeaders = {
            'Content-type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token'
          });
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postMethod(String url, dynamic body, String token) async {
    try {
      Response response = await post(url, body,
          headers: _mainHeaders = {
            'Content-type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token'
          });
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> patchMethod(String url, dynamic body, String token) async {
    try {
      Response response = await patch(url, body,
          headers: _mainHeaders = {
            'Content-type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token'
          });
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
