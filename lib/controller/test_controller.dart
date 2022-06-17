import 'dart:convert';

import 'package:api_post/controller/urls.dart';
import 'package:get/get.dart';

import '../helper/dialog_helper.dart';
import '../services/app_exceptions.dart';
import '../services/base_client.dart';
import 'base_controller.dart';

// import 'package:http_client/services/dio_client.dart';

class TestController extends GetxController with BaseController {

  var URLS = UrlStorage();

   getData() async {
    // showLoading('Fetching data');
    var response = await BaseClient().get("api.themoviedb.org" ,"/3/movie/now_playing").catchError(handleError);
    if (response == null) return;
    hideLoading();
    // return response;
    print(response);
  }
   getNews()async{
    // showLoading("Yangiliklar yuklanmoqda");
    var response = await BaseClient().get(URLS.newsMAinUrl(), URLS.newsUrl()).catchError(handleError);
    if (response == null) return;
    // hideLoading();
    print(response);
  }
  void postData() async {
    var request = {'message': 'CodeX sucks!!!'};
    showLoading('Posting data...');
    var response = await BaseClient().post('https://jsonplaceholder.typicode.com', '/posts', request).catchError((error) {
      if (error is BadRequestException) {
        var apiError = json.decode(error.message!);
        DialogHelper.showErroDialog(description: apiError["reason"]);
      } else {
        handleError(error);
      }
    });
    if (response == null) return;
    hideLoading();
    print(response);
  }
  dataPost(dynamic payload) async{
    showLoading('Checking user...');
    var response = await BaseClient().post("https://api.themoviedb.org" ,"/3/movie/now_playing?api_key=1500496dcaf1512b62894bd98ba83f9d&language=en-US", payload).catchError(handleError);
    if (response == null) return;
    hideLoading();
    return response;
  }

}
