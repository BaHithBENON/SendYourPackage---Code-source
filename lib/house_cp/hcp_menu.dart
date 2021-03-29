
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ryp/database/database.dart';
import 'package:ryp/house_cp/hcp_layout.dart';
import 'package:ryp/house_cp/hcp_module.dart';
import 'package:ryp/models/user_model.dart';


class HCPMenu extends StatefulWidget {
  @override
  _HCPMenuState createState() => _HCPMenuState();
}

class _HCPMenuState extends State<HCPMenu> 
  with TickerProviderStateMixin{

  Animation<double> animation;
  AnimationController animationController;
  Animation<double> animationTwo;
  AnimationController animationControllerTwo;

  bool tutoOver;

  @override
  void initState() {
    super.initState();
    tutoOver = false;
    animationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    animation = Tween(
      begin: -200.0, end: 50.0,
    ).animate(animationController)
    ..addListener(() {
      setState(() {
        isOver = true;
      });
    });

    animationControllerTwo = AnimationController(
      duration: Duration(milliseconds: 3000), vsync: this, value: .1
    );
    animationTwo = CurvedAnimation(
      parent: animationControllerTwo, 
      curve: Curves.bounceInOut,
    );

    animationController.forward();
    animationControllerTwo.forward();
  }

  bool isOver = false;

  void disposeThis() {
    animationController.dispose();
    animationControllerTwo.dispose();
  }

  @override
  void dispose() {
    Navigator.pop(context);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Text("by Ba'Hith BN",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Gl',
            color: Colors.black,
            fontSize: 10,
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          SafeArea(
            top: false, 
            bottom: true,
            child: Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Container(
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    WatchBoxBuilder(
                      box: Hive.box<User>(userBoxName),
                      builder: (context, data){
                        return Column(
                          children: <Widget>[
                            SizedBox(height: 10,),
                            Text(getIndicesSize() > getFirstUser().focusUser ?
                              "${getFirstUser.call().focusUser + 1}"
                              : "${getFirstUser.call().focusUser}",
                              style: TextStyle(
                                fontFamily: 'Ok',
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                                fontSize: 50,
                              ),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              child: Stack(
                                overflow: Overflow.visible,
                                children: <Widget>[
                                  ScaleTransition(
                                    scale: animationTwo,
                                    child: Transform.scale(
                                      scale: 1,
                                      child: GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            isOver = !isOver;
                                          });
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(top: 100),
                                          child: Image.asset("assets/images/letter2.png",
                                            width: MediaQuery.of(context).size.width,
                                            height: MediaQuery.of(context).size.height / 4,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  AnimatedPositioned(
                                    left: 30, right: 30,
                                    top: isOver ? -50 : - ((MediaQuery.of(context).size.width) + 50 ),
                                    duration: Duration(milliseconds: 500),
                                    child: ScaleTransition(
                                      scale: animationTwo,
                                      child: Transform.scale(
                                        scale: 1,
                                          child: GestureDetector(
                                            onTap: (){
                                              setState(() {
                                                isOver = !isOver;
                                              });
                                            },
                                            child: Image.asset("assets/images/letter.png",
                                              width: MediaQuery.of(context).size.width,
                                              height: MediaQuery.of(context).size.height / 3,
                                            ),
                                          ),
                                      ),
                                    ), 
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 50),
                              child: WatchBoxBuilder(
                                box: Hive.box<User>(userBoxName), 
                                builder: (context, data){
                                  User user = data.values.toList().first;
                                  return Column(
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text("Vie",
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Gl"
                                            ),
                                          ),
                                          Text("${user.lifeUser.toString()}/5",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Ok"
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text("Fonds",
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Gl"
                                            ),
                                          ),
                                          Text("${user.coinsUser.toString()} f",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Ok"
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text("Record",
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Gl"
                                            ),
                                          ),
                                          Text(user.highScore.toString(),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Ok"
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                }
                              ),
                            ),
                            SizedBox(height: 20,),
                            Baseline(
                              baseline: animation.value,
                              baselineType: TextBaseline.alphabetic,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                margin: EdgeInsets.symmetric(horizontal: 50),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    getIndicesSize() > getFirstUser().focusUser ? Listener(
                                      onPointerDown: (onPointerDown){
                                        dispose();
                                        Navigator.of(context).push(
                                          PageRouteBuilder(
                                            pageBuilder: (context, animation, anotherAnimation){
                                              return HCPLayout();
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
                                      }, 
                                      child: HCPModule(Icons.arrow_forward_ios),
                                    ) : SizedBox(),
                                    Listener(
                                      onPointerDown: (onPointerDown){
                                        dispose();
                                        userRestart();
                                        Navigator.of(context).push(
                                          PageRouteBuilder(
                                            pageBuilder: (context, animation, anotherAnimation){
                                              return HCPLayout();
                                            },
                                            transitionDuration: Duration(milliseconds: 1000),
                                            transitionsBuilder: (context, animation, anotherAnimation, child){
                                              animation = CurvedAnimation(
                                                parent: animation, 
                                                curve: Curves.bounceIn
                                              );
                                              return ScaleTransition(
                                                scale: animation, 
                                                child: child,
                                              );
                                            }
                                          )
                                        );
                                      },
                                      child: HCPModule(Icons.replay),
                                    ),
                                    Listener(
                                      onPointerDown: (onPointerDown){
                                        showModalBottomSheet(
                                          context: context, 
                                          builder: (builder){
                                            return Container(
                                              padding: EdgeInsets.symmetric(vertical: 20),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: <Widget>[
                                                  FlatButton(
                                                    onPressed: ()=> Navigator.pop(context), 
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
                                                        child: Text("Non",
                                                          style: TextStyle(
                                                          fontFamily: 'Gl',
                                                          color: Colors.white,
                                                          fontSize: 15,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ),
                                                  FlatButton(
                                                    onPressed: ()=> exit(0), 
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
                                                        child: Text("Oui",
                                                          style: TextStyle(
                                                          fontFamily: 'Gl',
                                                          color: Colors.white,
                                                          fontSize: 15,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ),
                                                ],
                                              ),
                                            );
                                          }
                                        );
                                      }, 
                                      child: HCPModule(Icons.close),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                    ),
                  ],
                ),
              ),
            )
          ),
        ],
      ),
    );
  }
}