import 'package:flutter/material.dart';
import 'package:mist/Services/Weather.dart';
class Home extends StatefulWidget {
  final weatherData;

  const Home({this.weatherData});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String cityName;
  int temperature;
  int condition;
  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherData);
  }
  void updateUI(dynamic weatherupdate){
    if(weatherupdate==null)
      {
        temperature =0;
        return;
      }
     double temp = weatherupdate['main']['temp'];
     temperature=temp.toInt();
     cityName = weatherupdate['name'];
     condition=weatherupdate['weather'][0]['id'];

     print(condition);
     print(cityName);
  }
   Weather weather = Weather();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
