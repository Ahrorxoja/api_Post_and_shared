import 'package:api_post/pages/kino_data.dart';
import 'package:api_post/pages/slider_page.dart';
import 'package:api_post/test_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'device_info.dart';
import 'new_api.dart';
import 'newsapi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: SliderPage(),
    );
  }
}
