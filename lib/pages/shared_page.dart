import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class SheredPage extends StatefulWidget {
  const SheredPage({Key? key}) : super(key: key);

  @override
  _SheredPageState createState() => _SheredPageState();
}

class _SheredPageState extends State<SheredPage> {
  String username = '';

  void sucses() async {
    final pref = await SharedPreferences.getInstance();
    if (pref.getString('key') != null) {
      setState(() {
        username = pref.getString('key')!;
      });
    }
  }
  fetchMovies() async {
    var url;
    url = await http.get(Uri.parse(("https://api.themoviedb.org/3/movie/now_playing?api_key=1500496dcaf1512b62894bd98ba83f9d&language=en-US$username")));
    return json.decode(url.body)['results'];
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
        title: Text("Shered Page"),
      ),
      body: Container(
        child: Column(
          children: [
            Center(
              child: Text(
                "${username}",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
