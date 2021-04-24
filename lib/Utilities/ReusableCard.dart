import 'package:flutter/material.dart';
class ReusableCard extends StatelessWidget {
  final int color1;
  final int color2;
  final double heigh;
  final Widget ChildWidget;

  ReusableCard({this.color1, this.color2, this.heigh,this.ChildWidget});
  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(top: 100),
      height: heigh,
      width: 320,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(color1),
                Color(color2)
              ]
          )
      ),
      child: ChildWidget,
    );
  }
}
//
//