import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SliderContainer extends StatefulWidget {
  const SliderContainer({Key? key}) : super(key: key);

  @override
  _SliderContainerState createState() => _SliderContainerState();
}

class _SliderContainerState extends State<SliderContainer> {
  double width = 0 ;

  void sucses() async {
    final pref = await SharedPreferences.getInstance();
    if (pref.getDouble('width') != null) {
      setState(() {
        width = pref.getDouble('width')!;
      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sucses();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slider Container"),
      ),
      body: Container(
        child: Center(
          child: Container(
            width: width,
            height: width,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
