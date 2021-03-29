import 'package:flutter/material.dart';
import 'package:ryp/database/database.dart';


class Tutos extends StatefulWidget {
  @override
  _TutosState createState() => _TutosState();
}

class _TutosState extends State<Tutos> {

  int tutoStep;

  @override
  void initState() {
    super.initState();
    tutoStep = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0, left: 0, right: 0, bottom: 0,
      child: Container(
        color: Colors.black.withOpacity(.1),
        child: Listener(
          onPointerDown: (onPointerDown){
            if (tutoStep == 4) {
              userStarted();
            } else {
              setState(() {
                tutoStep++;
              });
            }
          },
          child: tutoStep == 0 ? Stack(
            children: <Widget>[
              Positioned(
                top: 0, left: 0, right: 0, bottom: 40,
                child: Container(
                  height: 50,
                  color: Colors.black.withOpacity(.8),
                ),
              ),
              Container(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: Text("Cette partie marque l'évolution d'un point de vie de 0% à 100%",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: 'Gl'
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ) : tutoStep == 1 ? Stack(
            children: <Widget>[
              Positioned(
                top: 0, left: 0, right: 0,
                child: Container(
                  height: (MediaQuery.of(context).size.height / 2)  + 100,
                  color: Colors.black.withOpacity(.8),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Text("Devinette à résoudre. Le résultat est lié à un objet de la maison",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontFamily: 'Gl'
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0, right: 0, bottom: 40,
                child: Container(
                  height: (MediaQuery.of(context).size.width / 2),
                  color: Colors.transparent,
                ),
              ),
              Positioned(
                left: 0, right: 0, bottom: 0,
                child: Container(
                  height: 40,
                  color: Colors.black.withOpacity(.8),
                ),
              ),
            ],
          ) : tutoStep == 2 ? Stack(
            children: <Widget>[
              Positioned(
                top: 0, left: 0, right: 0,
                child: Container(
                  height: (MediaQuery.of(context).size.width / 2) + 50,
                  color: Colors.black.withOpacity(.8),
                ),
              ),
              Positioned(
                left: 0, right: 0, bottom: 40,
                child: Container(
                  height: (MediaQuery.of(context).size.width / 2),
                  color: Colors.transparent,
                ),
              ),
              Positioned(
                left: 0, right: 0, bottom: 0,
                child: Container(
                  height: (MediaQuery.of(context).size.height / 3),
                  color: Colors.black.withOpacity(.8),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Text("Voici la partie de la maison où se trouve l'objet résultant de la devinette."
                        " Cet objet sert à déclencher l'énigme du code postal.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontFamily: 'Gl'
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ) : tutoStep == 3 ? Stack(
            children: <Widget>[
              Positioned(
                top: 80, left: 0, right: 0, bottom: 0,
                child: Container(
                  height: 50,
                  color: Colors.black.withOpacity(.8),
                ),
              ),
              Container(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: Text("Ces coeurs représentent le nombre de vie",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: 'Gl'
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ) : tutoStep == 4 ?  Stack(
            children: <Widget>[
              Positioned(
                top: 0, left: 0, right: 0,
                child: Container(
                  height: 80,
                  color: Colors.black.withOpacity(.8),
                ),
              ),
              Positioned(
                left: 0, right: 0, bottom: 40,
                child: Container(
                  height: (MediaQuery.of(context).size.width / 2),
                  color: Colors.transparent,
                ),
              ),
              Positioned(
                left: 0, right: 0, bottom: 0,
                child: Container(
                  height: (MediaQuery.of(context).size.height / 3) * 2,
                  color: Colors.black.withOpacity(.8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 0),
                            child: Text("Meilleur score et score en cours de partie",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontFamily: 'Gl'
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 0),
                            child: Text("Fonds représentants les rénumérations du joueur et indice payant",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontFamily: 'Gl'
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ) : SizedBox(),
        ),
      ),
    );
  }
}