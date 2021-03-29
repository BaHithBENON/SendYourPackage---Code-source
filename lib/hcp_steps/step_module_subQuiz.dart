import 'package:flutter/material.dart';
import 'package:ryp/database/database.dart';



// ignore: must_be_immutable
class StepModuleSubQuiz extends StatefulWidget {

  Function functionOnTap;
  double top, bottom, left, right;
  double height, width;
  String text;

  static String textText = "";

  StepModuleSubQuiz(this.functionOnTap, this.height, this.width,
    {this.top, this.bottom, this.left, this.right, this.text}
  );

  @override
  _StepModuleSubQuizState createState() => _StepModuleSubQuizState();
}

class _StepModuleSubQuizState extends State<StepModuleSubQuiz> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.top != null ? widget.top : null, 
      bottom: widget.bottom != null ? widget.bottom : null,
      right: widget.right != null ? widget.right : null,
      left: widget.left != null ? widget.left : null,
      child: GestureDetector(
        onTap: (){
          if(
            getFirstUser().coinsUser > 10 
            && getFirstUser().lifeUser > 0
            && getFirstUser().lifeUser < 5
          ) diminitionUserLife();

          StepModuleSubQuiz.textText = widget.text;
          widget.functionOnTap();
        },
        child: Container(
          height: widget.height, width: widget.width, color: Colors.transparent,
        ),
      ),
    );
  }
}