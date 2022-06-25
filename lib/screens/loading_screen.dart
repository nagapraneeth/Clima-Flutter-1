import 'package:flutter/material.dart';
import '../services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(latitude);
    print(longitude);
  }

  void getdata() async {
    final url =
        'https://samples.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=38aed0c4127b29e1b9825305b4e3a594';
    http.Response response = await http.get(Uri.parse(url));
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    getLocation();
    getdata();
    return Scaffold();
  }
}
