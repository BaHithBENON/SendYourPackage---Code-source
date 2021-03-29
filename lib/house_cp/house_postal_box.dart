import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ryp/database/database.dart';
import 'package:ryp/hcp_steps/keyboard.dart';
import 'package:ryp/hcp_steps/step.dart';
import 'package:ryp/hcp_steps/step_module_subQuiz.dart';
import 'package:ryp/models/indice_model.dart';
import 'package:ryp/models/user_model.dart';


// ignore: must_be_immutable
class HousePostalBox extends StatefulWidget {
  Function overFunction;

  HousePostalBox({this.overFunction});

  @override
  _HousePostalBoxState createState() => _HousePostalBoxState(
    overFunction: this.overFunction,
  );
}

class _HousePostalBoxState extends State<HousePostalBox> 
  with TickerProviderStateMixin{

  Function overFunction;

  _HousePostalBoxState({this.overFunction});

  Indice idc;

  Animation<double> animation;
  AnimationController animationController;

  bool isOver = false;
  bool indiceDisplay = false;
  bool infoDisplay = false;
  bool nothingDisplay = false;
  bool keyboard = false;
  bool subQuiz = false;

  void _closedDisplay(){
    setState(() {
      isOver = false;
      indiceDisplay = false;
      infoDisplay = false;
      nothingDisplay = false;
      keyboard = false;
    });
  }

  String indiceLabel = "";
  String infobonus = "";
  String subQuizText = "";

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(milliseconds: 3000), vsync: this, value: .1);
    animation = CurvedAnimation(
      parent: animationController, 
      curve: Curves.bounceInOut
    )..addListener(() {
      if (animation.isCompleted) {}
    });
    animationController.forward();
  }

  void disposeThis() {
    setState(() {
      animationController.dispose();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.transparent,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              WatchBoxBuilder(
                box: Hive.box<User>(userBoxName), 
                builder: (context, data){
                  User user = data.values.toList().first;
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Gl',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(text: "Code "),
                          TextSpan(text: "${user.focusUser + 1}", 
                            style: TextStyle(color: Colors.red, fontFamily: 'Ok'),
                          ),
                        ]
                      )
                    ),
                  );
                }
              ),
              SizedBox(height: 50,),
              WatchBoxBuilder(
                box: Hive.box<Indice>(indiceBoxName), 
                builder: (context, data){
                  Indice indice;
                  data.values.toList().forEach((element) {
                    if (element.idIndice == getFirstUser().focusUser) {
                      indice = element;
                    }
                  });
                  return Column(
                    children: <Widget>[
                      ScaleTransition(
                        scale: animation,
                        child: Transform.scale(
                          scale: 1,
                          child: Steps()
                            ..indice = indice
                            ..step = getFirstUser().focusUser
                            ..functionOnTap = (){
                              setState(() {
                                indiceDisplay = false;
                                isOver = !isOver;
                              });
                            }
                            ..functionOnTapInfo = (){
                              setState(() {
                                infoDisplay = !infoDisplay;
                              });
                            }
                            ..functionOnTapNothing = (){
                              setState(() {
                                nothingDisplay = !nothingDisplay;
                              });
                            }
                            ..functionOnTapSubQuiz = setSubQuizText
                        ),
                      ),
                      SizedBox(height: 50,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: SingleChildScrollView(
                          child: Text(indice.contextIndice,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Gl',
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                            ),
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
        Positioned(
          top: 100, right: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text("Fonds",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Gl"
                ),
              ),
              GestureDetector(
                onTap: (){ },
                child: WatchBoxBuilder(
                  box: Hive.box<User>(userBoxName), 
                  builder: (context, data){
                    User user = data.values.toList().first;
                    return Container(
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
                          child: Text("${user.coinsUser.toString()} f".toUpperCase(),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Ok"
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                ),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  coinsValue();
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
                      child: Text("!",
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
        Positioned(
          right: 20, bottom: 60,
          child: GestureDetector(
            onTap: (){
              setState(() {
                keyboard = !keyboard;
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
                    Colors.teal,
                    Colors.blue,
                  ]
                ),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                  child: Icon(Icons.keyboard, color: Colors.white,),
                ),
              ),
            ),
          ),
        ),
        AnimatedPositioned(
          duration: Duration(milliseconds: 500),
          left: 10, right: 10,
          top: isOver ? 200 : - ((MediaQuery.of(context).size.width * 2)),
          child: WatchBoxBuilder(
            box: Hive.box<Indice>(indiceBoxName),
            builder : (context, data){
              Indice indice;
              data.values.toList().forEach((element) {
                if (element.idIndice == getFirstUser().focusUser) {
                  indice = element;
                }
              });
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onVerticalDragEnd: (details){
                        setState(() {
                          isOver = false;
                        });
                        _closedDisplay();
                      },
                      child: Card(
                        elevation: 4,
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
                            height: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SingleChildScrollView(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: List.generate(indice.quizLines.length, 
                                          (index) => Text(indice.quizLines[index],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontFamily: 'Gl',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          ),
        ),
        AnimatedPositioned(
          duration: Duration(milliseconds: 500),
          left: 10, right: 10,
          bottom: keyboard ? 100 : -300,
          child: WatchBoxBuilder(
            box: Hive.box<Indice>(indiceBoxName),
            builder : (context, data){
              Indice indice;
          
              data.values.toList().forEach((element) {
                if (element.idIndice == getFirstUser().focusUser) {
                  indice = element;
                  // indice.quizList.forEach((quizElement) {
                  //   if(quizElement.priority == 1) 
                  //     quiz = quizElement;
                  //   else quiz = Quiz();
                  // });
                }
              });

              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onVerticalDragEnd: (details){
                        setState(() {
                          keyboard = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.transparent,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            KeyboardHCP()
                              ..changed = verif
                              ..rightRep = indice.result.toString()
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          ),
        ),
        AnimatedPositioned(
          duration: Duration(milliseconds: 500),
          left: 10, right: 10,
          top: infoDisplay ? 150 : - ((MediaQuery.of(context).size.width * 2)),
          child: WatchBoxBuilder(
            box: Hive.box<Indice>(indiceBoxName),
            builder : (context, data){
              Indice indice;
              data.values.toList().forEach((element) {
                if (element.idIndice == getFirstUser().focusUser) {
                  indice = element;
                }
              });
              return  Card(
                elevation: 4,
                child: Listener(
                  onPointerDown: (onPointerDown){ 
                    setState(() {
                      infoDisplay = false;
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
                      child: Center(
                        child: Text(indice.infobonus,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Gl'
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }
          ),
        ),
        AnimatedPositioned(
          duration: Duration(milliseconds: 500),
          left: 10, right: 10,
          bottom: nothingDisplay ? 100 : -300,
          child: Card(
            elevation: 4,
            child: Listener(
              onPointerDown: (onPointerDown){ 
                setState(() {
                  nothingDisplay = false;
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
                  child: Center(
                    child: Text("Y'a rien ici. Désolé !!!",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Gl'
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        AnimatedPositioned(
          duration: Duration(milliseconds: 500),
          left: subQuiz ? 10 : MediaQuery.of(context).size.width/2, 
          right: subQuiz ? 10 : MediaQuery.of(context).size.width/2,
          bottom: 100,
          child: Card(
            elevation: 4,
            child: Listener(
              onPointerDown: (onPointerDown){ 
                setState(() {
                  subQuiz = false;
                  subQuizText = "";
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
                  child: Center(
                    child: Text(subQuizText,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Gl'
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        AnimatedPositioned(
          duration: Duration(milliseconds: 500),
          left: 30, right: 30,
          bottom: indiceDisplay ? 60 : -300,
          child: Card(
            elevation: 4,
            child: Listener(
              onPointerDown: (onPointerDown){ 
                setState(() {
                  indiceDisplay = false;
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
                  child: Center(
                    child: Text(indiceLabel,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Gl',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  
  setSubQuizText(){
    setState(() {
      subQuizText = StepModuleSubQuiz.textText;
      subQuiz = true;
    });
  }

  coinsValue(){
    if (!indiceDisplay) {
      if (getFirstUser().coinsUser >= 5) {
        setState(() {
          indiceLabel = getActuallyIndice().indiceResult;
        });
        diminutionCoins(5);
      } else {
        setState(() {
          indiceLabel = "Fonds insuffisants";
        });
      }
      setState(() {
        indiceDisplay = true;
      });
    } else setState(() {
      indiceDisplay = false;
    });
  }

  verif(){
    augementedPlayerLevel();
    disposeThis();
    overFunction();
  }

}