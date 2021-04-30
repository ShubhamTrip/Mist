import 'package:flutter/material.dart';
import 'package:mist/Services/Weather.dart';
class weatherCard extends StatelessWidget {
  const weatherCard({
    Key key,
    @required this.temperature,
    @required this.day,
    @required this.cityName,
    @required this.condition,
  }) : super(key: key);

  final int temperature;
  final String day;
  final String cityName;
  final int condition;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [

        Text("$temperature°",style: TextStyle(fontSize: 40,color: Colors.white)),

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
        Text("${Weather().getWeatherIcon(condition)}",style: TextStyle(fontSize: 50,color: Colors.yellowAccent,))
      ],
    );
  }
}
