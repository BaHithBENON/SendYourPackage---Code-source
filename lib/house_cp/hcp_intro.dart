import 'package:flutter/material.dart';
import 'dart:math' as Math;

import 'package:ryp/house_cp/hcp_rules.dart';


class IntroGame extends StatefulWidget {
  @override
  _IntroGameState createState() => _IntroGameState();
}

class _IntroGameState extends State<IntroGame> {


  int lyricsSteps;

  @override
  void initState() {
    super.initState();
    lyricsSteps = 0;
  }

  @override
  void dispose() {
    Navigator.pop(context);
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 100, left: 50,
            child: Transform.rotate(
              angle: -Math.pi / 12.0,
              child: Text("1825",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                  fontFamily: 'Gl'
                ),
              ),
            ),
          ),
          Positioned(
            top: 100, left: 50,
            child: Transform.rotate(
              angle: Math.pi / 12.0,
              child: Text("Code",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                  fontFamily: 'Gl'
                ),
              ),
            ),
          ),
          Positioned(
            top: 100, right: 50,
            child: Transform.rotate(
              angle: -Math.pi / 12.0,
              child: Text("Livreur",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                  fontFamily: 'Gl'
                ),
              ),
            ),
          ),
          Positioned(
            top: 130, right: 50,
            child: Transform.rotate(
              angle: Math.pi / 12.0,
              child: Text("Parakou",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                  fontFamily: 'Gl'
                ),
              ),
            ),
          ),
          Positioned(
            top: 150, left: 120,
            child: Transform.rotate(
              angle: Math.pi / 12.0,
              child: Text("Cotonou",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                  fontFamily: 'Gl'
                ),
              ),
            ),
          ),
          Positioned(
            top: 50, left: 120,
            child: Transform.rotate(
              angle: Math.pi / 12.0,
              child: Text("Bénin",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                  fontFamily: 'Gl'
                ),
              ),
            ),
          ),
          Positioned(
            top: 200, left: 10,
            child: Transform.rotate(
              angle: 0,
              child: Text("Saoudite",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                  fontFamily: 'Gl'
                ),
              ),
            ),
          ),
          Positioned(
            top: 50, left: 10,
            child: Transform.rotate(
              angle: 0,
              child: Text("Togo",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                  fontFamily: 'Gl'
                ),
              ),
            ),
          ),
          Positioned(
            top: 50, right: 10,
            child: Transform.rotate(
              angle: 0,
              child: Text("Nigéria",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                  fontFamily: 'Gl'
                ),
              ),
            ),
          ),
          Positioned(
            top: 250, right: 10,
            child: Transform.rotate(
              angle: 0,
              child: Text("Kyoto",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                  fontFamily: 'Gl'
                ),
              ),
            ),
          ),
          Positioned(
            top: 210, right: 10,
            child: Transform.rotate(
              angle: 1,
              child: Text("Tokyo",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                  fontFamily: 'Gl'
                ),
              ),
            ),
          ),
          Positioned(
            top: 350, left: 10,
            child: Transform.rotate(
              angle: 4,
              child: Text("Strasbourg",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                  fontFamily: 'Gl'
                ),
              ),
            ),
          ),
          Positioned(
            top: 350, right: 10,
            child: Transform.rotate(
              angle: -Math.pi / 12.0,
              child: Text("Angoulême",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                  fontFamily: 'Gl'
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 5, left: 10, right: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(" Tapes pour la suite...",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontFamily: 'Gl'
                  ),
                ),
                Card(
                  elevation: 4,
                  child: Listener(
                    onPointerDown: (onPointerDown){
                      setState(() {
                          lyricsSteps++;
                        });
                      if (lyricsSteps == introLyrics.length) {
                        dispose();
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder: (context, animation, anotherAnimation){
                              return GameRules();
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
                      }
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
                          child: Text(lyricsSteps < introLyrics.length ? "${introLyrics[lyricsSteps]}" : "",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: 'Gl'
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
        ],
      ),
    );
  }
}


List introLyrics = [
  "Hello, moi c'est Hitho, ton coursier à plein temps.",
  "Je livrerai tes colis à n'importe quelle adresse.",
  "Pour ça, trouves le code postal de l'adresse de livraison dans ta maison.",
  "Commencer."
];