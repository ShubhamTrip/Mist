import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading_Screen extends StatefulWidget {
  @override
  _Loading_ScreenState createState() => _Loading_ScreenState();
}

class _Loading_ScreenState extends State<Loading_Screen> {
  @override
  void initState() {
    super.initState();
  }

  void geoLocation(){

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
