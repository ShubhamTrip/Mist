import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
class Report_today extends StatelessWidget {
  const Report_today({
    Key key,
    @required this.feelslike,
    @required this.mintemp,
    @required this.maxtemp,
    @required this.windspeed,
    @required this.humidity,
    @required this.pressure,
  }) : super(key: key);

  final double feelslike;
  final double mintemp;
  final double maxtemp;
  final double windspeed;
  final int humidity;
  final int pressure;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(leading: Text("Feels Like",style: TextStyle(color: Colors.white,fontSize: 13),),
          title: Icon(Icons.thermostat_outlined,color: Colors.white,),
          trailing: Text('$feelslike',style: TextStyle(color: Colors.white,fontSize: 13)),
        ),
        ListTile(leading: Text("Min Temp°",style: TextStyle(color: Colors.white,fontSize: 13),),
          title: Icon(Icons.thermostat_outlined,color: Colors.white,),
          trailing: Text('$mintemp',style: TextStyle(color: Colors.white,fontSize: 13)),
        ),
        ListTile(leading: Text("Max Temp°",style: TextStyle(color: Colors.white,fontSize: 13),),
          title: Icon(Icons.thermostat_outlined,color: Colors.white,),
          trailing: Text('$maxtemp',style: TextStyle(color: Colors.white,fontSize: 13)),
        ),
        ListTile(leading: Text("WindSpeed",style: TextStyle(color: Colors.white,fontSize: 13),),
          title: Icon(Icons.waves,color: Colors.white,),
          trailing: Text('$windspeed',style: TextStyle(color: Colors.white,fontSize: 13)),
        ),
        ListTile(leading: Text("Humidity",style: TextStyle(color: Colors.white,fontSize: 13),),
          title: Icon(WeatherIcons.raindrop,color: Colors.white,),
          trailing: Text('$humidity',style: TextStyle(color: Colors.white,fontSize: 13)),
        ),
        ListTile(leading: Text("Pressure    ",style: TextStyle(color: Colors.white,fontSize: 13),),
          title: Icon(Icons.line_weight,color: Colors.white,),
          trailing: Text('$pressure',style: TextStyle(color: Colors.white,fontSize: 13)),
        )
      ],
    );
  }
}
