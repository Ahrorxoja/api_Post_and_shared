import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import '../controller/ConstantHttp.dart';
import 'app_exceptions.dart';

class BaseClient {
  static const int TIME_OUT_DURATION = 20;

  //GET
  Future<dynamic> get(String baseUrl, String api) async {
    var uri = Uri.https(baseUrl, api,{"api_key":"1500496dcaf1512b62894bd98ba83f9d","language":"en-US"});
    try {
      log("API-$uri");

      var response =
          await http.get(uri).timeout(Duration(seconds: TIME_OUT_DURATION));
      log("API-$uri");
      log("Response-${_processResponse(response)}");
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  //POST
  Future<dynamic> post(String baseUrl, String api, dynamic payloadObj) async {
    var uri = Uri.parse(baseUrl + api);
    var payload = json.encode(payloadObj);
    try {
      var response = await http.post(uri, body: payload, headers: ConstantHttp.header).timeout(Duration(seconds: TIME_OUT_DURATION));
      log("API-$uri");
      log("API Type-POST");
      log("Response-${_processResponse(response)}");

      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }


  //DELETE
  //OTHER

  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
        break;
      case 201:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
        break;
      case 400:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 401:
      case 403:
        throw UnAuthorizedException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 422:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured with code : ${response.statusCode}',
            response.request!.url.toString());
    }
  }
}
