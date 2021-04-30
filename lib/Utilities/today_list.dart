import "package:flutter/material.dart";
class Hourly extends StatelessWidget {
  const Hourly({
    Key key,
    @required this.time_9,
    @required this.time_12,
    @required this.time_15,
    @required this.time_18,
    @required this.time_21,
    @required this.time_00,
  }) : super(key: key);

  final double time_9;
  final double time_12;
  final double time_15;
  final double time_18;
  final double time_21;
  final double time_00;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Text("9:00 AM",style: TextStyle(color: Colors.white),),
          title: Icon(Icons.thermostat_rounded,color: Colors.white,),
          trailing: Text("$time_9",style: TextStyle(color: Colors.white),),
        ),
        ListTile(
          leading: Text("12:00 PM",style: TextStyle(color: Colors.white),),
          title: Icon(Icons.thermostat_rounded,color: Colors.white,),
          trailing: Text("$time_12",style: TextStyle(color: Colors.white),),
        ),
        ListTile(
          leading: Text("15:00 PM",style: TextStyle(color: Colors.white),),
          title: Icon(Icons.thermostat_rounded,color: Colors.white,),
          trailing: Text("$time_15",style: TextStyle(color: Colors.white),),
        ),
        ListTile(
          leading: Text("18:00 PM",style: TextStyle(color: Colors.white),),
          title: Icon(Icons.thermostat_rounded,color: Colors.white,),
          trailing: Text("$time_18",style: TextStyle(color: Colors.white),),
        ),
        ListTile(
          leading: Text("21:00 PM",style: TextStyle(color: Colors.white),),
          title: Icon(Icons.thermostat_rounded,color: Colors.white,),
          trailing: Text("$time_21",style: TextStyle(color: Colors.white),),
        ),
        ListTile(
          leading: Text("00:00 AM",style: TextStyle(color: Colors.white),),
          title: Icon(Icons.thermostat_rounded,color: Colors.white,),
          trailing: Text("$time_00",style: TextStyle(color: Colors.white),),
        )

      ],
    );
  }
}
