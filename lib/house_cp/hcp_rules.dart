import 'package:flutter/material.dart';
import 'package:ryp/house_cp/hcp_menu.dart';

class GameRules extends StatefulWidget {
  @override
  _GameRulesState createState() => _GameRulesState();
}

class _GameRulesState extends State<GameRules> {

  @override
  void dispose() {
    Navigator.pop(context);
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 20,),
                    Text("Règles et objectifs du jeu",
                      style: TextStyle(
                        fontFamily: 'Ok',
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Column(
                      children: List.generate(rules.length, (index) => 
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Text("${index + 1} - ${rules[index]}",
                            style: TextStyle(
                              fontFamily: 'Gl',
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 5, left: 20, right: 20,
              child: Listener(
                onPointerDown: (onPointerDown){
                  dispose();
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
                      child: Text("Compris !",
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
    );
  }
}


List<String> rules = [
  "Votre rôle est de trouver un code postal",
  "A chaque partie, trouvez la réponse à la devinette proposée",
  "Toucher ensuite l'objet correspondant dans la chambre",
  "Résoudre l'énigme proposée, ce qui fera office du code postal",
  "Attention ! Toucher n'importe où peut vous diminuer de la vie"
];