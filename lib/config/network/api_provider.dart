import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'api_exceptions.dart';

class ApiProvider {
  final String _baseUrl = "https://b2c.24x7smart.com/index.php/visa_api/";
  _setHeaders(String token) => {
        "Content-type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      };

  Future<dynamic> postRequest(data, url, token) async {
    // print(data);
    dynamic responseJson;
    try {
      final uri = Uri.parse(_baseUrl + url);
      final response = await http
          .post(uri, body: jsonEncode(data), headers: _setHeaders(token))
          .timeout(const Duration(seconds: 20));

      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    } on TimeoutException {
      throw TimeOutException("Try again");
    }
    return responseJson;
  }

  Future<dynamic> getRequest(url, token) async {
    dynamic responseJson;
    try {
      final uri = Uri.parse(_baseUrl + url);
      final response = await http
          .get(uri, headers: _setHeaders(token))
          .timeout(const Duration(seconds: 15));

      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    } on TimeoutException {
      throw FetchDataException("Request timeout try again");
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    print(response.statusCode);
    print(response.body);
    switch (response.statusCode) {
      case 200:
      case 201:
      case 202:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(
            json.decode(response.body)['message'].toString());
      case 401:
      case 403:
        throw UnauthorisedException(
            json.decode(response.body)['message'].toString());
      case 404:
        throw BadRequestException('Not found');
      case 500:
        throw FetchDataException('Internal Server Error');
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
