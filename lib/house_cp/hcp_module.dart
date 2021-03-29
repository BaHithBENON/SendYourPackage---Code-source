
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class HCPModule extends StatelessWidget {

  IconData iconData;

  HCPModule(this.iconData);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [
            Colors.amber,
            Colors.red,
            Colors.amberAccent,
          ]
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [
              Colors.black.withOpacity(.8),
              Colors.black.withOpacity(.8),
            ]
          ),
          borderRadius: BorderRadius.circular(5)
        ),
        child: Icon(iconData,
          color: Colors.white,
        ),
      ),
    );
  }
}