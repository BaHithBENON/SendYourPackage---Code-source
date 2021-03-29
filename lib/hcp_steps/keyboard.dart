import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:ryp/database/database.dart';


// ignore: must_be_immutable
class KeyboardHCP extends StatefulWidget {

  Function changed;
  String rightRep;

  KeyboardHCP({this.changed, this.rightRep});

  @override
  _KeyboardState createState() => _KeyboardState(
    changed: this.changed,
    rightRep: this.rightRep
  );
}

class _KeyboardState extends State<KeyboardHCP> {

  Function changed;
  String rightRep;
  String resultValue;
  
  var clavier = [
    1,2,3,4,5,
    6,7,8,9,0,
  ];

  _KeyboardState({this.changed, this.rightRep});

  @override
  void initState(){
    resultValue = "|";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            color: Colors.blueGrey,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(resultValue,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Ok',
                    fontSize: 20,
                  ),
                ),
                RaisedButton(
                  onPressed: (){
                    setState(() {
                      resultValue = "|";
                    });
                  },
                  child: Text("x",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Ok',
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: GridView.count(
                crossAxisCount: 10,
                scrollDirection: Axis.vertical,
                children: 
                  List.generate(clavier.length, (index) => 
                  RaisedButton(
                    color: Colors.black,
                    onPressed: (){
                      final audio = AudioCache();
                      audio.play(audioClickPuzzleGrid);
                      if(resultValue == "|") {  
                        setState(() {
                          resultValue = "";
                        });
                      }
                      setState(() {
                        resultValue = resultValue + clavier[index].toString();
                      });
                      verif();
                    },
                    child: Center(
                      child: Text(clavier[index].toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Ok'
                        ),
                      ),
                    ),
                  ),
                )
              ),
            ),
          ),
        ],
      ),
    );
  }

  verif(){
    if(rightRep.toString().toUpperCase() == resultValue.toUpperCase()){
      changed();
    }
  }
}