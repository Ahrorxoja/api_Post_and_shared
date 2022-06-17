import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../controller/test_controller.dart';

class LoginPagePost extends StatefulWidget {
  const LoginPagePost({Key? key}) : super(key: key);

  @override
  _LoginPagePostState createState() => _LoginPagePostState();
}

class _LoginPagePostState extends State<LoginPagePost> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passswordController = TextEditingController();
  String? userName;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("login page"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.grey),
                      labelText: 'Enter your username',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: IconTheme(
                          data: IconThemeData(color: Colors.purple),
                          child: Icon(Icons.phone),
                        ),
                      )),
                  style: const TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                  controller: _emailController,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.grey),
                      labelText: 'Enter password',
                      border: OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.teal)),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: IconTheme(
                          data: IconThemeData(color: Colors.purple),
                          child: Icon(Icons.phone),
                        ),
                      )),
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                  controller: _passswordController,
                ),
              ),
              TextButton(
                onPressed: () async {
                  userName = _emailController.text;
                  password = _passswordController.text;
                  var response = await TestController().dataPost({
                    "email": "${_emailController}",
                    "password": "${_passswordController}"
                  });
                  print("response: $response");
                },
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
