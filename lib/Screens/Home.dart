import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mist/Services/Weather.dart';
import 'package:mist/Utilities/ReusableCard.dart';
import 'package:mist/Utilities/cardContent.dart';
import 'package:mist/Utilities/constants.dart';
class Home extends StatefulWidget {
  final weatherData;

  const Home({this.weatherData});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  String cityName;
  int temperature;
  int condition;
  TabController _controller;
  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherData);
    _controller = TabController(length: 3, vsync: this);
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
          body: ListView(
             children: [
               Padding(
                 padding: const EdgeInsets.only(top: 30,left: 15),
                 child: Text("Todays",style: TextStyle(fontSize: 25,color: Colors.white)),
               ),
               ReusableCard(heigh: 100,color1: 0XFF003973,color2: 0XFFBDDCF8,
               ChildWidget: weatherCard(temperature: temperature, day: day, cityName: cityName, condition: condition),
               ),
               Container(child: TextField(decoration: kTextFieldInputDecoration),margin: EdgeInsets.only(left: 15,right: 15,top: 20),),
               ReusableCard(heigh: 420,color1: 0XFF003973,color2: 0XFF348F50,
                ChildWidget: Column(
                  children: [
                    Container(
                      height: 67,
                      child: TabBar(

                        controller: _controller,
                        labelStyle: TextStyle(fontSize: 9),
                        labelPadding: EdgeInsets.only(top: 10,bottom: 10),
                        indicatorColor: Colors.white70,

                        tabs: [
                          Tab(
                            icon: const Icon(Icons.home),
                            text: 'Address',
                          ),
                          Tab(
                            icon: const Icon(Icons.my_location),
                            text: 'Location',
                          ),
                          Tab(
                            icon: const Icon(Icons.add),
                            text: 'Add',
                          )

                        ],
                      ),
                    )
                  ],
                )

               )

             ],
          )
          ),
      )
    );
  }
}

