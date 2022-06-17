import 'package:flutter/material.dart';

class True extends StatefulWidget {
  final dynamic phone;

  const True({Key? key, this.phone}) : super(key: key);

  @override
  _TrueState createState() => _TrueState();
}

class _TrueState extends State<True> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("malimotlar togri"),
        ),
      ),
    );
  }
}
