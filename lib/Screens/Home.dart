import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mist/Services/Weather.dart';
import 'package:mist/Utilities/ReusableCard.dart';
import 'package:mist/Utilities/cardContent.dart';
import 'package:mist/Utilities/constants.dart';
import 'package:mist/Utilities/Report_today.dart';
import 'package:mist/Utilities/today_list.dart';
class Home extends StatefulWidget {
  final weatherData;
  final interData;
  const Home({this.weatherData,this.interData});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  String cityName;
  String typedName;
  int temperature;
  int condition,pressure,humidity;
  double windspeed;
  double mintemp,maxtemp,feelslike;
  double time_9 ,time_12,time_15, time_18,time_21,time_00;
  TabController _controller;
  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherData,widget.interData);
    _controller = TabController(length: 2, vsync: this);
  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void updateUI(dynamic weatherupdate , dynamic interupdate){
    if(weatherupdate==null)
      {
        temperature =0;
        return;
      }
     var temp = weatherupdate['main']['temp'];
     temperature=temp.toInt();
     cityName = weatherupdate['name'];
     condition=weatherupdate['weather'][0]['id'];
     windspeed=weatherupdate['wind']['speed'];
     mintemp = weatherupdate['main']['temp_min'];
     maxtemp = weatherupdate['main']['temp_max'];
     pressure= weatherupdate['main']['pressure'];
     humidity = weatherupdate['main']['humidity'];
     feelslike = weatherupdate['main']['feels_like'];

     // today list

     time_9 = interupdate['list'][0]['main']['temp'];
     time_12 = interupdate['list'][1]['main']['temp'];
     time_15 =interupdate['list'][2]['main']['temp'];
     time_18 = interupdate['list'][3]['main']['temp'];
     time_21 = interupdate['list'][4]['main']['temp'];
     time_00 = interupdate['list'][5]['main']['temp'];
  }
  Future<dynamic> getCityData(String city)async
  {
    Weather weather = Weather();
    var data = await weather.getCityData(city);
    var interdata = await weather.getCityinterData(city);
    updateCity(data,interdata);
  }
  void updateCity(dynamic cityupdate,dynamic interupdate){
    if(cityupdate==null)
    {
      temperature =0;
      return;
    }
    var temp = cityupdate['main']['temp'];
    temperature=temp.toInt();
    cityName = cityupdate['name'];
    condition=cityupdate['weather'][0]['id'];
    windspeed=cityupdate['wind']['speed'];
    mintemp = cityupdate['main']['temp_min'];
    maxtemp = cityupdate['main']['temp_max'];
    pressure= cityupdate['main']['pressure'];
    humidity = cityupdate['main']['humidity'];
    feelslike = cityupdate['main']['feels_like'];

    // today list

    time_9 = interupdate['list'][0]['main']['temp'];
    time_12 = interupdate['list'][1]['main']['temp'];
    time_15 =interupdate['list'][2]['main']['temp'];
    time_18 = interupdate['list'][3]['main']['temp'];
    time_21 = interupdate['list'][4]['main']['temp'];
    time_00 = interupdate['list'][5]['main']['temp'];
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
               Container(child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Container(child: TextField(
                     decoration: kTextFieldInputDecoration,
               onChanged: (value){
               typedName = value;
               },
               ), width: 500),
                   IconButton(icon: Icon(Icons.search), onPressed: ()async{
                     if(typedName != null) {

                      setState(() {
                        getCityData(typedName);
                      });

                     }
                   })
                 ],
               ),margin: EdgeInsets.only(left: 15,right: 15,top: 20),
               decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),),
               ReusableCard(heigh: 420,color1: 0XFF003973,color2: 0XFF348F50,
                ChildWidget: Column(
                  children: [
                    Container(
                      height: 50,
                      child: TabBar(

                        controller: _controller,
                        labelStyle: TextStyle(fontSize: 12),
                        labelPadding: EdgeInsets.only(top: 10,bottom: 10),
                        indicatorColor: Colors.white70,

                        tabs: [
                          Tab(
                            text: 'Todays Report',
                          ),
                          Tab(
                            text: 'Hourly Report',
                          ),

                        ],

                      ),

                    ),
                    Container(
                      height: 370,
                      child: TabBarView(
                        controller: _controller,
                        children: [
                          ReusableCard(heigh: 370,color1: 0XFF0000,color2: 0Xff0000,
                            ChildWidget: Report_today(feelslike: feelslike, mintemp: mintemp, maxtemp: maxtemp,
                                                      windspeed: windspeed, humidity: humidity, pressure: pressure),),
                          ReusableCard(heigh: 370,color1: 0XFF0000,color2: 0Xff0000,
                            ChildWidget: Hourly(time_9: time_9, time_12: time_12, time_15: time_15, time_18: time_18,
                                                time_21: time_21, time_00: time_00),
                          ),
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



