import 'package:flutter/material.dart';

class False extends StatefulWidget {
  final dynamic phone;
  const False({Key? key,required this.phone,}) : super(key: key);

  @override
  _FalseState createState() => _FalseState();
}

class _FalseState extends State<False> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("malimotlar hato"),
      ),
    );
  }
}
