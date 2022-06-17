import 'dart:convert';

import 'package:api_post/controller/base_controller.dart';
import 'package:api_post/false.dart';
import 'package:api_post/pages/shared_page.dart';
import 'package:api_post/true.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'controller/test_controller.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'models/album.dart';

class TestPage extends StatefulWidget {
  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final controller = TestController();

  String? message;

  // String? nummer = "";
  TextEditingController _phoneController = TextEditingController();

  var maskFormatter = new MaskTextInputFormatter(
      mask: '(##) ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  var device = DeviceInfoPlugin();
  List userList = [];


  Future<dynamic> postData() async{
    final pref = await SharedPreferences.getInstance();
    message = "+998${_phoneController.text}";
    // controller.dataPost({"phone_number" : "$message"});
    var response = await TestController().getData();
    return json.decode(response.body)['results'];

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return ;
      }
    print("response: $response");
    Map<String, dynamic> user = jsonDecode(response);
    pref.setString('key', user['message']);
    print(pref.getString('key'));
    print('message saqlandi');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    postData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TestPage')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () async {
                controller.getData();
                // if(response )
              },
              child: Text('GET Data', style: TextStyle(fontSize: 24)),
            ),
            ElevatedButton(
              onPressed: () async {
                controller.postData();
              },
              child: Text('POST Data', style: TextStyle(fontSize: 24)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    prefix: Text("+998 "),
                    prefixStyle: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.grey),
                    hintText: "Phone number",
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.teal)),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: IconTheme(
                        data: IconThemeData(color: Colors.purple),
                        child: Icon(Icons.phone),
                      ),
                    )),
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                controller: _phoneController,
                inputFormatters: [maskFormatter],
              ),
            ),
            FutureBuilder<dynamic>(
              future: postData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    padding: EdgeInsets.all(8),
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          Container(
                            height: 250,
                            alignment: Alignment.centerLeft,
                            child: Card(
                              child: Image.network(
                                  "https://image.tmdb.org/t/p/w500" +
                                      snapshot.data[index]['poster_path']),
                            ),
                          ),
                          SizedBox(width: 20,),
                          Expanded(
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Text(
                                    snapshot.data[index]["original_title"],
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    snapshot.data[index]["release_date"],
                                    style: TextStyle(color: Color(0xff868597)),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 100,
                                    child: Text(
                                      snapshot.data[index]["overview"],
                                      style: TextStyle(color: Color(0xff868597)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
            // Text("$"),
            ElevatedButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SheredPage()),
                );
                // final pref = await SharedPreferences.getInstance();
                // message = "+998${_phoneController.text}";
                // // controller.dataPost({"phone_number" : "$message"});
                // var response = await TestController().dataPost(
                //     {"phone_number": "+998${maskFormatter.getUnmaskedText()}"});
                // print("response: $response");
                // Map<String, dynamic> user = jsonDecode(response);
                // pref.setString('key', user['message']);
                // print(pref.getString('key'));
                // print('message saqlandi');

                // if (response == null) return print("NULL RESPONSE ");
                // if (response["code"] == 0) {
                //   Get.to(True(
                //     phone: message,
                //   ));
                // } else {
                //   Get.to(False(
                //     phone: message,
                //   ));
                // }
                // print(message);
                // print(Response["code"]);
                // nummer =
              },
              child: Text('Data Post', style: TextStyle(fontSize: 24)),
            ),
            // Text(nummer!)
          ],
        ),
      ),
    );
  }
}

class JsonToDart {
  int? userId;
  int? id;
  String? title;
  bool? completed;

  JsonToDart({this.userId, this.id, this.title, this.completed});

  JsonToDart.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['completed'] = this.completed;
    return data;
  }
}
