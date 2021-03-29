import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ryp/database/database.dart';
import 'package:ryp/house_cp/hcp_intro.dart';
import 'package:ryp/house_cp/hcp_menu.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Duration duration = Duration(seconds: 2);
  int time = 0;
  Timer timer;
  
  @override
  void dispose(){
    timer = null;
    timer.cancel();
    Navigator.pop(context);
    super.dispose();
  }

  delay(){
    Timer.periodic(duration, (timer){
      setState(() {
        time++;
        if(time == 10){
          
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (context, animation, anotherAnimation){
                return getFirstUser().hadStarted ? HCPMenu() : IntroGame();
              },
              transitionDuration: Duration(milliseconds: 1500),
              transitionsBuilder: (context, animation, anotherAnimation, child){
                animation = CurvedAnimation(
                  parent: animation, 
                  curve: Curves.easeOutExpo
                );
                return ScaleTransition(
                  scale: animation, 
                  child: child,
                );
              }
            )
          );

          dispose();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    delay();

    return Scaffold(
      body: SafeArea(
        top: false,
        child: Container(
          color: Colors.grey[900],
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Container(
            child: Stack(
              alignment: Alignment.center,
              fit: StackFit.expand,
              children: [
                Positioned(
                  top: MediaQuery.of(context).size.width - 50,
                  child: Text("Send Your",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Bf',
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow,
                      fontSize: 50,
                    ),
                  ),
                ),
                Positioned(
                  bottom: MediaQuery.of(context).size.width - 80,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text:"",
                      style: TextStyle(
                        fontFamily: 'Lv',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      children: [
                        TextSpan(text: "P", style: TextStyle(fontSize: 30),),
                        TextSpan(text: "A", style: TextStyle(fontSize: 35),),
                        TextSpan(text: "C", style: TextStyle(fontSize: 40),),
                        TextSpan(text: "K", style: TextStyle(fontSize: 45),),
                        TextSpan(text: "A", style: TextStyle(fontSize: 40),),
                        TextSpan(text: "G", style: TextStyle(fontSize: 35),),
                        TextSpan(text: "E", style: TextStyle(fontSize: 30),),
                      ]
                    )
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.width - 55,
                  child: Text("by Ba'Hith BN",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Bf',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  child: Text("$time %",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Lv',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}