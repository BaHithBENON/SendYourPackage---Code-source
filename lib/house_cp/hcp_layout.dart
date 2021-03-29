
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ryp/database/database.dart';
import 'package:ryp/house_cp/hcp_menu.dart';
import 'package:ryp/house_cp/hcp_tuto.dart';
import 'package:ryp/house_cp/hcp_module.dart';
import 'package:ryp/house_cp/house_postal_box.dart';
import 'package:ryp/models/user_model.dart';


class HCPLayout extends StatefulWidget {
  @override
  _HCPLayoutState createState() => _HCPLayoutState();
}

class _HCPLayoutState extends State<HCPLayout> {

  int progress;
  int timePassed;
  int tutoStep;

  bool buyLife;

  @override
  void initState() {
    super.initState();
    progress = 0;
    buyLife = false;
    timePassed = 0;
    tutoStep = 0;
    startTimer();
  }

  void disposeThis() {
    setState(() {
      timer = null; 
      timer.cancel();
    });
    Navigator.pop(context);
  }

  @override
  void dispose() {
    setState(() {
      timer = null; 
      timer.cancel();
    });
    Navigator.pop(context);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        maintainBottomViewPadding: false,
        top: false, bottom: false,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: WatchBoxBuilder(
            box: Hive.box<User>(userBoxName),
            builder: (context, data){
              User user = data.values.toList().first;
              return Stack(
                fit: StackFit.loose,
                children: <Widget>[
                  Positioned(
                    top: 100, left: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Record",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Gl"
                          ),
                        ),
                        GestureDetector(
                          onTap: (){},
                          child: Container(
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
                              padding: EdgeInsets.symmetric(horizontal: 15,),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                gradient: LinearGradient(
                                  begin: Alignment.centerRight,
                                  end: Alignment.centerLeft,
                                  colors: [
                                    Colors.grey[500],
                                    Colors.black.withOpacity(.8),
                                  ]
                                )
                              ),
                              child: Center(
                                child: Text(getFirstUser().highScore.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Ok"
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text("Score",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Gl"
                          ),
                        ),
                        GestureDetector(
                          onTap: (){},
                          child: Container(
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
                              padding: EdgeInsets.symmetric(horizontal: 15,),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                gradient: LinearGradient(
                                  begin: Alignment.centerRight,
                                  end: Alignment.centerLeft,
                                  colors: [
                                    Colors.grey[500],
                                    Colors.black.withOpacity(.8),
                                  ]
                                )
                              ),
                              child: Center(
                                child: Text(progress.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Ok"
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: SingleChildScrollView(
                          child: HousePostalBox()
                            ..overFunction = overFunction
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 0, left: 0, right: 0,
                    child: SafeArea(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20,),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.grey,
                              Colors.white,
                              Colors.grey
                            ]
                          ),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 1),
                              blurRadius: 2,
                              spreadRadius: 0,
                            )
                          ]
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
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
                                padding: EdgeInsets.symmetric(horizontal: 10,),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  gradient: LinearGradient(
                                    begin: Alignment.centerRight,
                                    end: Alignment.centerLeft,
                                    colors: [
                                      Colors.grey[500],
                                      Colors.black.withOpacity(.8),
                                    ]
                                  )
                                ),
                                child: Center(
                                  child: Text("${user.lifeUser} / 5",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Ok"
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  buyLife = !buyLife;
                                });
                              },
                              child: Row(
                                children: <Widget>[
                                  Text(".->",
                                    style: TextStyle(
                                      fontFamily: 'Ok',
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Icon(
                                    user.lifeUser >= 1 ? 
                                      Icons.favorite : Icons.favorite_border,
                                    color: user.lifeUser >= 1 ?
                                      Colors.red : Colors.black,
                                  ),
                                  Icon(
                                    user.lifeUser >= 2 ? 
                                      Icons.favorite : Icons.favorite_border,
                                    color: user.lifeUser >= 2 ?
                                      Colors.red : Colors.black,
                                  ),
                                  Icon(
                                    user.lifeUser >= 3 ? 
                                      Icons.favorite : Icons.favorite_border,
                                    color: user.lifeUser >= 3 ?
                                      Colors.red : Colors.black,
                                  ),
                                  Icon(
                                    user.lifeUser >= 4 ? 
                                      Icons.favorite : Icons.favorite_border,
                                    color: user.lifeUser >= 4 ?
                                      Colors.red : Colors.black,
                                  ),
                                  Icon(
                                    user.lifeUser == 5 ? 
                                      Icons.favorite : Icons.favorite_border,
                                    color: user.lifeUser == 5 ?
                                      Colors.red : Colors.black,
                                  ),
                                  Text("<-.",
                                    style: TextStyle(
                                      fontFamily: 'Ok',
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                children: <Widget>[
                                  Listener(
                                    onPointerDown: (onPointerDown){
                                      
                                      Navigator.of(context).push(
                                        PageRouteBuilder(
                                          pageBuilder: (context, animation, anotherAnimation){
                                            return HCPMenu();
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
                                    },
                                    child: Container(
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
                                        padding: EdgeInsets.symmetric(horizontal: 10,),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          gradient: LinearGradient(
                                            begin: Alignment.centerRight,
                                            end: Alignment.centerLeft,
                                            colors: [
                                              Colors.grey[500],
                                              Colors.black.withOpacity(.8),
                                            ]
                                          ),
                                        ),
                                        child: Center(
                                          child: Icon(Icons.close,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0, left: 0, right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.grey,
                            Colors.white,
                            Colors.grey
                          ]
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 1),
                            blurRadius: 2,
                            spreadRadius: 0,
                          )
                        ]
                      ),
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
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
                              padding: EdgeInsets.symmetric(horizontal: 10,),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                gradient: LinearGradient(
                                  begin: Alignment.centerRight,
                                  end: Alignment.centerLeft,
                                  colors: [
                                    Colors.grey[500],
                                    Colors.black.withOpacity(.8),
                                  ]
                                )
                              ),
                              child: Center(
                                child: Text("$timePassed %",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Ok"
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Container(
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
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    gradient: LinearGradient(
                                      begin: Alignment.centerRight,
                                      end: Alignment.centerLeft,
                                      colors: [
                                        Colors.grey[500],
                                        Colors.black.withOpacity(.8),
                                      ]
                                    )
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: List.generate(10, (index) =>
                                      Container(
                                        height: 10, width: 20,
                                        color:  timePassed / 10 > index ?
                                          Colors.lightGreenAccent : Colors.greenAccent,
                                      ),
                                    ),
                                  )
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 500),
                    left: 30, right: 30,
                    bottom: buyLife ? 60 : -300,
                    child: Card(
                      elevation: 4,
                      child: Listener(
                        onPointerDown: (onPointerDown){ 
                          setState(() {
                            buyLife = false;
                          });
                        },
                        child: Container(
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
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              gradient: LinearGradient(
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft,
                                colors: [
                                  Colors.black.withOpacity(.8),
                                  Colors.black.withOpacity(.8),
                                ]
                              ),
                            ),
                            child: Column(
                              children: <Widget>[
                                Text("10f",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontFamily: 'Ok'
                                  ),
                                ),
                                Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 100,
                                ),
                                getFirstUser().coinsUser > 10 
                                && getFirstUser().lifeUser > 0
                                && getFirstUser().lifeUser < 5 ? Listener(
                                  onPointerDown: (onPointerDown){
                                    diminutionCoins(10);
                                    augementedUserLife();
                                    setState(() {
                                      buyLife = false;
                                    });
                                  }, 
                                  child: HCPModule(Icons.check),
                                ) : Text("Supplément Indisponible",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Gl'
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  getFirstUser().hadStarted ? SizedBox() 
                  : Tutos(),
                ],
              );
            }
          ),
        ),
      ),
    );
  }

  void overFunction(){

    highScore(progress);
    
    if (getFirstUser().lifeUser == 5) augmentedCoins(10);
    else if (getFirstUser().lifeUser == 4) augmentedCoins(8);
    else if (getFirstUser().lifeUser == 3) augmentedCoins(6);
    else if (getFirstUser().lifeUser == 2) augmentedCoins(4);
    else if (getFirstUser().lifeUser == 1) augmentedCoins(2);

    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, anotherAnimation){
          return HCPMenu();
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

  Timer timer;
  static const duration = Duration(seconds: 1);

  void goToMenu(){
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, anotherAnimation){
          return HCPMenu();
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

  void startTimer(){
    if (timer == null) {
      timer = Timer.periodic(duration, (t) {
        setState(() {
          if (timePassed == 100) {
            diminitionUserLife();
            timePassed = 0;
          } else {
            timePassed++;
            progress += 1;
          }
        });

        if (getFirstUser().lifeUser == 0) {
          userRegress();
          goToMenu();
        }
      });
    }
  }
}
