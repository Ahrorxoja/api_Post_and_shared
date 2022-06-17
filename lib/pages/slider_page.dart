import 'package:api_post/pages/slider_container.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({Key? key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _currentSliderValue = 50;

  Future<dynamic> shered() async {
    final pref = await SharedPreferences.getInstance();
    pref.setDouble('width', _currentSliderValue);
  }
  double width  = 0;

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
    shered();
    sucses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slider Page"),
      ),
      body: Center(
        child: Column(
          children: [
            Slider(
              value: _currentSliderValue,
              max: 300,
              min: 50,
              divisions: 5,
              label: _currentSliderValue.round().toString(),
              onChanged: (double value,) {
                shered();
                sucses();
                setState(() {
                  _currentSliderValue = value;
                });
              },
            ),
            Text("$_currentSliderValue"),
            Container(
              width: width,
              height: width,
              color: Colors.red,
            ),
            TextButton(
              onPressed: () { Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SliderContainer()),
              );},
              child: Text("next"),
            ),
          ],
        ),
      ),
    );
  }
}
