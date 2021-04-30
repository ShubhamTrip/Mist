import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mist/Screens/Home.dart';
import 'package:mist/Services/Weather.dart';
class Loading_Screen extends StatefulWidget {
  @override
  _Loading_ScreenState createState() => _Loading_ScreenState();
}

class _Loading_ScreenState extends State<Loading_Screen> {
  @override
  void initState() {
    super.initState();
    geoLocation();
  }

  void geoLocation()async{
    Weather weather = Weather();
    var weatherData = await weather.getWeatherData();
    var interData = await weather.getInterData();
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return Home(weatherData: weatherData,interData:interData,);
    }));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: SpinKitCircle(
          color: Colors.red[500],
        ))
    );
  }
}
