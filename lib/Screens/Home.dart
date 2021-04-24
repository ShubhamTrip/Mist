import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mist/Services/Weather.dart';
import 'package:mist/Utilities/ReusableCard.dart';
import 'package:weather_icons/weather_icons.dart';
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
     var temp = weatherupdate['main']['temp'];
     temperature=temp.toInt();
     cityName = weatherupdate['name'];
     condition=weatherupdate['weather'][0]['id'];
     print(condition);
     print(cityName);

  }
   Weather weather = Weather();
  @override
  Widget build(BuildContext context) {
    var date = DateTime.now();
    String day = DateFormat('EEE, d MMMM').format(date);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.3,0.8],
            colors: [

              Color(0XFF051036),
              Color(0XFF000000)
            ],
          ),
        ),
        child:Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
             children: [

               Center(
                 child: ReusableCard(heigh: 100,color1: 0XFF4B93FF,color2: 0XFFBDDCF8,
                 ChildWidget: Row(
                    children: [
                      SizedBox(width: 20,),
                      Text("$temperature°",style: TextStyle(fontSize: 40,color: Colors.white)),
                      SizedBox(width: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 32,),
                          Text("$day",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700)),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Icon(Icons.pin_drop,size: 13,color: Colors.white70,),
                              SizedBox(width: 2),
                              Text("$cityName",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600)),
                            ],
                          ),


                        ],
                      ),
                      SizedBox(width: 70),
                      Text("${Weather().getWeatherIcon(800)}",style: TextStyle(fontSize: 50),)
                    ],
                 ),

                 ),
               )
             ],
          )
          ),
      )
    );
  }
}
