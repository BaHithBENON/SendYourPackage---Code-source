
import 'package:flutter/material.dart';
import 'package:ryp/hcp_steps/step_module.dart';
import 'package:ryp/hcp_steps/step_module_info.dart';
import 'package:ryp/hcp_steps/step_module_nothing.dart';
import 'package:ryp/hcp_steps/step_module_subQuiz.dart';
import 'package:ryp/models/indice_model.dart';

// ignore: must_be_immutable
class Steps extends StatefulWidget {

  Indice indice;
  int step;
  Function functionOnTap;
  Function functionOnTapInfo;
  Function functionOnTapNothing;
  Function functionOnTapSubQuiz;

  Steps({this.indice, this.step, this.functionOnTap, 
    this.functionOnTapInfo, this.functionOnTapNothing, this.functionOnTapSubQuiz});

  @override
  _StepsState createState() => _StepsState(
    indice : this.indice,
    step : this.step,
    functionOnTap : this.functionOnTap,
    functionOnTapInfo: this.functionOnTapInfo,
    functionOnTapNothing: this.functionOnTapNothing,
    functionOnTapSubQuiz: this.functionOnTapSubQuiz,
  );
}

class _StepsState extends State<Steps> {

  Indice indice;
  int step;
  Function functionOnTap;
  Function functionOnTapInfo;
  Function functionOnTapNothing;
  Function functionOnTapSubQuiz;

  String text;

  String tapSubQuiz(String text){
    return text;
  }

  _StepsState({this.indice, this.step, this.functionOnTap, 
    this.functionOnTapInfo, this.functionOnTapNothing, this.functionOnTapSubQuiz});


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(indice.img,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 3,
        ),

        step == 0 ?
          StepModule(functionOnTap, 20, 20, 
          top: 55, left: (MediaQuery.of(context).size.width / 2) - 28)
          : SizedBox(),
        step == 0 ? 
          StepModuleInfo(functionOnTapInfo, 20, 20, 
          top: 55, right: (MediaQuery.of(context).size.width / 2) - 90)
          : SizedBox(),
        step == 0 ?  StepModuleNothing(functionOnTapNothing, 40, 20, 
          top: 180, left: (MediaQuery.of(context).size.width / 2) - 70)
          : SizedBox(),



        step == 1 ? 
          StepModule(functionOnTap, 10, MediaQuery.of(context).size.width/2, 
          top: 175, right: (MediaQuery.of(context).size.width / 2) - 90)
          : SizedBox(),
        step == 1 ? 
          StepModuleInfo(functionOnTapInfo, 50, 100, 
          top: 120, left: (MediaQuery.of(context).size.width / 2) - 50)
          : SizedBox(),
        step == 1 ? 
          StepModuleInfo(functionOnTapNothing, 20, 40, 
          top: 90, left: (MediaQuery.of(context).size.width / 2) - 70)
          : SizedBox(),
        step == 1 ? 
          StepModuleNothing(functionOnTapNothing, 20, 40, 
          top: 90, left: (MediaQuery.of(context).size.width / 2) - 70)
          : SizedBox(),

          
        step == 2 ? 
          StepModule(functionOnTap, MediaQuery.of(context).size.width / 6, MediaQuery.of(context).size.width/4 - 50, 
          top: 45, right: (MediaQuery.of(context).size.width / 2) - 60)
          : SizedBox(),
        step == 2 ? 
          StepModuleInfo(functionOnTapInfo, 50, 40, 
          top: 160, left: (MediaQuery.of(context).size.width / 2) - 70)
          : SizedBox(),
        step == 2 ? 
          StepModuleNothing(functionOnTapNothing, 20, 70, 
          top: 162, right: (MediaQuery.of(context).size.width / 2) - 78)
          : SizedBox(),
        step == 2 ? 
          StepModuleSubQuiz(functionOnTapSubQuiz, 20, 70, text: "Une vie de moins",
          top: 185, right: (MediaQuery.of(context).size.width / 2) - 78)
          : SizedBox(),
        step == 2 ? 
          StepModuleSubQuiz(functionOnTapSubQuiz, 20, 70, text: "Une vie de moins",
          top: 140, right: (MediaQuery.of(context).size.width / 2) - 78)
          : SizedBox(),

    

        step == 3 ? 
          StepModule(functionOnTap,(MediaQuery.of(context).size.width / 6) / 2, MediaQuery.of(context).size.width/4 - 60, 
          top: 145, right: 40)
          : SizedBox(),
        step == 3 ? 
          StepModuleInfo(functionOnTapInfo, 60, 120, 
          top: 115, left: (MediaQuery.of(context).size.width / 2) - 60)
          : SizedBox(),
        step == 3 ? 
          StepModuleNothing(functionOnTapNothing, 20, 40, 
          top: 185, right: 62)
          : SizedBox(),
        step == 3 ? 
          StepModuleNothing(functionOnTapNothing, 50, 40, 
          top: 70, left: 75)
          : SizedBox(),
        step == 3 ? 
          StepModuleSubQuiz(functionOnTapSubQuiz, 30, 35, text: "Une vie de moins", 
          top: 70, right: (MediaQuery.of(context).size.width / 2) - 20)
          : SizedBox(),
        step == 3 ? 
          StepModuleSubQuiz(functionOnTapSubQuiz, 30, 15, text: "Une vie de moins", 
          top: 180, left: 50)
          : SizedBox(),



        step == 4 ? 
          StepModule(functionOnTap,(MediaQuery.of(context).size.width / 6) / 2, MediaQuery.of(context).size.width/4 - 60, 
          top: 60,  right: (MediaQuery.of(context).size.width / 2) - 30,)
          : SizedBox(),
        step == 4 ? 
          StepModuleInfo(functionOnTapInfo, 80, 95, 
          top: 115, left: (MediaQuery.of(context).size.width / 2) - 35)
          : SizedBox(),
        step == 4 ? 
          StepModuleNothing(functionOnTapNothing, 25, 40, 
          top: 190, left: 80)
          : SizedBox(),
        step == 4 ? 
          StepModuleSubQuiz(functionOnTapSubQuiz, 20, 35, text: "Une vie de moins", 
          top: 30, right: (MediaQuery.of(context).size.width / 2) - 30)
          : SizedBox(),


          
        step == 5 ? 
          StepModule(functionOnTap,(MediaQuery.of(context).size.width / 6) / 2.5, MediaQuery.of(context).size.width/4 - 60, 
          top: 140,  right: (MediaQuery.of(context).size.width / 2) - 50,)
          : SizedBox(),
        step == 5 ? 
          StepModuleInfo(functionOnTapInfo, (MediaQuery.of(context).size.width / 6) / 2.5, MediaQuery.of(context).size.width/4 - 60,  
          top: 83, right: 60)
          : SizedBox(),
        step == 5 ? 
          StepModuleNothing(functionOnTapNothing, 10, 40, 
          top: 150, right: 55)
          : SizedBox(),
        step == 5 ? 
          StepModuleSubQuiz(functionOnTapSubQuiz, 10, 40, text: "Une vie de moins", 
          top: 164, right: 55)
          : SizedBox(),



        step == 6 ? 
          StepModule(functionOnTap,(MediaQuery.of(context).size.width / 6) / 2.5, MediaQuery.of(context).size.width/4 - 60, 
          top: 85,  right: 70)
          : SizedBox(),
        step == 6 ? 
          StepModuleInfo(functionOnTapInfo, (MediaQuery.of(context).size.width / 6) / 2, 25,  
          top: 30, right: 70)
          : SizedBox(),
        step == 6 ? 
          StepModuleNothing(functionOnTapNothing, 35, 10, 
          top: 150, left: 100)
          : SizedBox(),
        step == 6 ? 
          StepModuleNothing(functionOnTapNothing, 35, 60, 
          top: 45, left: 70)
          : SizedBox(),
        step == 6 ? 
          StepModuleSubQuiz(functionOnTapSubQuiz, 70, 110, text: "Une vie de moins", 
          top: 100, left: 125)
          : SizedBox(),


        step == 7 ? 
          StepModule(functionOnTap,(MediaQuery.of(context).size.width / 6) / 2.5, MediaQuery.of(context).size.width/4 - 60, 
          top: 120,  left: 10)
          : SizedBox(),
        step == 7 ? 
          StepModuleInfo(functionOnTapInfo, 70, 70,  
          top: 105, right: 122)
          : SizedBox(),
        step == 7 ? 
          StepModuleNothing(functionOnTapNothing, 35, 30, 
          top: 140, right: 18)
          : SizedBox(),
        step == 7 ? 
          StepModuleSubQuiz(functionOnTapSubQuiz, 20, 42, text: "Une vie de moins", 
          top: 100, left: 88)
          : SizedBox(),



        step == 8 ? 
          StepModule(functionOnTap,(MediaQuery.of(context).size.width / 6) / 2.5, 10, 
          top: 150,  right: (MediaQuery.of(context).size.width / 3) - 15)
          : SizedBox(),
        step == 8 ? 
          StepModuleInfo(functionOnTapInfo, 40, 35,  
          top: 135, left: 85)
          : SizedBox(),
        step == 8 ? 
          StepModuleNothing(functionOnTapNothing, 35, 30, 
          top: 75, left: 150)
          : SizedBox(),
        step == 8 ? 
          StepModuleSubQuiz(functionOnTapSubQuiz, 35, 30,  text: "Une vie de moins", 
          top: 75, right: 140)
          : SizedBox(),



        step == 9 ? 
          StepModule(functionOnTap,15, 15, 
          top: 128, left: (MediaQuery.of(context).size.width / 3) - 6)
          : SizedBox(),
        step == 9 ? 
          StepModuleInfo(functionOnTapInfo, 25, 25,  
          top: 65, right: 120)
          : SizedBox(),
        step == 9 ? 
          StepModuleNothing(functionOnTapNothing, 45, 70, 
          top: 80, left: 120)
          : SizedBox(),
        step == 9 ? 
          StepModuleSubQuiz(functionOnTapSubQuiz, 30, 42,  text: "Une vie de moins", 
          top: 110, left: 197)
          : SizedBox(),



        step == 10 ? 
          StepModule(functionOnTap,15, 50, 
          top: 200, left: 90)
          : SizedBox(),
        step == 10 ? 
          StepModuleInfo(functionOnTapInfo, 25, 30,  
          top: 130, left: 65)
          : SizedBox(),
        step == 10 ? 
          StepModuleNothing(functionOnTapNothing, 30, 50, 
          top: 165, left: 90)
          : SizedBox(),
        step == 10 ? 
          StepModuleSubQuiz(functionOnTapSubQuiz, 40, 70,  text: "Une vie de moins", 
          top: 100, left: 150)
          : SizedBox(),




        step == 11 ? 
          StepModule(functionOnTap,25, 25, 
          top: 120, right: 110)
          : SizedBox(),
        step == 11 ? 
          StepModuleInfo(functionOnTapInfo, 25, 20,  
          top: 68, right: 90)
          : SizedBox(),





        step == 12 ? 
          StepModule(functionOnTap,50, 92, 
          top: 40, left: 125,)
          : SizedBox(),
        step == 12 ? 
          StepModuleInfo(functionOnTapInfo, 40, 40,  
          top: 170, left: 30)
          : SizedBox(),
        step == 12 ? 
          StepModuleSubQuiz(functionOnTapSubQuiz, 30, 60, text: "Une vie de moins",  
          top: 120, left: 100)
          : SizedBox(),
        step == 12 ? 
          StepModuleSubQuiz(functionOnTapSubQuiz, 30, 60, text: "Une vie de moins",  
          top: 120, right: 120)
          : SizedBox(),
        step == 12 ? 
          StepModuleNothing(functionOnTapNothing, 30, 50, 
          top: 160, right: 35)
          : SizedBox(),



        step == 13 ? 
          StepModule(functionOnTap,20, 13, 
          top: 108, left: 118,)
          : SizedBox(),
        step == 13 ? 
          StepModuleInfo(functionOnTapInfo, 25, 50,  
          top: 95, left: 150)
          : SizedBox(),
        step == 13 ? 
          StepModuleSubQuiz(functionOnTapSubQuiz, 20, 50,  text: "Une vie de moins", 
          top: 130, left: 85)
          : SizedBox(),
        step == 13 ? 
          StepModuleSubQuiz(functionOnTapSubQuiz, 20, 50,  text: "Une vie de moins", 
          top: 130, right: 90)
          : SizedBox(),
        step == 13 ? 
          StepModuleNothing(functionOnTapNothing, 20, 50, 
          top: 170, left: 85)
          : SizedBox(),
        step == 13 ? 
          StepModuleNothing(functionOnTapNothing, 20, 50,
          top: 170, right: 90)
          : SizedBox(),



        step == 14 ? 
          StepModule(functionOnTap,60, 50, 
          top: 118, left: 150,)
          : SizedBox(),
        step == 14 ? 
          StepModuleInfo(functionOnTapInfo, 40, 55,  
          top: 45, left: 80)
          : SizedBox(),
        step == 14 ? 
          StepModuleSubQuiz(functionOnTapSubQuiz, 30, 60, text: "Une vie de moins",  
          top: 45, right: 80)
          : SizedBox(),
        step == 14 ? 
          StepModuleNothing(functionOnTapNothing, 90, 55, 
          top: 90, left: 80)
          : SizedBox(),
        



        step == 15 ? 
          StepModule(functionOnTap,15, 25, 
          top: 30, left: 125,)
          : SizedBox(),
        step == 15 ? 
          StepModuleInfo(functionOnTapInfo, 38, 25,  
          top: 165, right: 35)
          : SizedBox(),




        step == 16 ? 
          StepModule(functionOnTap,20, 80, 
          top: 30, left: 175,)
          : SizedBox(),
        step == 16 ? 
          StepModuleInfo(functionOnTapInfo, 45, 50,  
          top: 160, left: 85)
          : SizedBox(),
        step == 16 ? 
          StepModuleNothing(functionOnTapNothing, 45, 135, 
          top: 160, right: 75)
          : SizedBox(),



        step == 17 ? 
          StepModule(functionOnTap,20, 10, 
          top: 185, right: 128,)
          : SizedBox(),
        step == 17 ? 
          StepModuleInfo(functionOnTapInfo, 30, 25,  
          top: 95, left: 170)
          : SizedBox(),
        step == 17 ? 
          StepModuleSubQuiz(functionOnTapSubQuiz, 35, 35,  text: "Une vie de moins", 
          top: 75, left: 95)
          : SizedBox(),
        step == 17 ? 
          StepModuleSubQuiz(functionOnTapSubQuiz, 35, 60,  text: "Une vie de moins", 
          top: 160, left: 80)
          : SizedBox(),
        step == 17 ? 
          StepModuleNothing(functionOnTapNothing, 50, 40, 
          top: 150, right: 40)
          : SizedBox(),



        step == 18 ? 
          StepModule(functionOnTap,60, 60, 
          top: 150, left: 80,)
          : SizedBox(),
        step == 18 ? 
          StepModuleInfo(functionOnTapInfo, 120, 65,  
          top: 85, left: 140)
          : SizedBox(),
        step == 18 ? 
          StepModuleNothing(functionOnTapNothing, 50, 125, 
          top: 155, left: 205)
          : SizedBox(),



        step == 19 ? 
          StepModule(functionOnTap,30, 30, 
          top: 150, right: 70,)
          : SizedBox(),
        step == 19 ? 
          StepModuleInfo(functionOnTapInfo, 28, 50,  
          top: 70, left: 165)
          : SizedBox(),
        step == 19 ? 
          StepModuleSubQuiz(functionOnTapSubQuiz, 18, 45,  text: "Une vie de moins", 
          top: 122, left: 120)
          : SizedBox(),
        step == 19 ? 
          StepModuleSubQuiz(functionOnTapSubQuiz, 18, 45,  text: "Une vie de moins", 
          top: 156, left: 120)
          : SizedBox(),
        step == 19 ? 
          StepModuleNothing(functionOnTapNothing, 20, 15, 
          top: 40, right: 130)
          : SizedBox(),



        step == 20 ? 
          StepModule(functionOnTap,15, 35, 
          top: 130, left: 115,)
          : SizedBox(),
        step == 20 ? 
          StepModule(functionOnTap,15, 35, 
          top: 130, right: 165,)
          : SizedBox(),



        step == 21 ? 
          StepModule(functionOnTap,15, 25, 
          top: 90, right: 155,)
          : SizedBox(),
        step == 22 ? 
          StepModule(functionOnTap,15, 35, 
          top: 90, left: 115,)
          : SizedBox(),
        step == 23 ? 
          StepModule(functionOnTap,33, 25, 
          top: 140, right: 53,)
          : SizedBox(),
        step == 24 ? 
          StepModule(functionOnTap,50, 55, 
          top: 33, right: 100,)
          : SizedBox(),
        step == 25 ? 
          StepModule(functionOnTap,90, 35, 
          top: 75, right: 70,)
          : SizedBox(),
        step == 25 ? 
          StepModule(functionOnTap,90, 35, 
          top: 75, left: 70,)
          : SizedBox(),
        step == 26 ? 
          StepModule(functionOnTap,50, 75, 
          top: 110, left: 140,)
          : SizedBox(),
        step == 27 ? 
          StepModule(functionOnTap,5, 30, 
          top: 163, left: 155,)
          : SizedBox(),
        step == 28 ? 
          StepModule(functionOnTap, 20, 15, 
          top: 155, right: 110,)
          : SizedBox(),
        step == 29 ? 
          StepModule(functionOnTap, 15, 15, 
          top: 145, left: 140,)
          : SizedBox(),
        step == 30 ? 
          StepModule(functionOnTap, 90, 160, 
          top: 140, left: 95,)
          : SizedBox(),
        step == 30 ? 
          StepModule(null, 70, 80, 
          top: 155, left: 105,)
          : SizedBox(),
        step == 31 ? Positioned(
          top: 205, 
          left: 145, right: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(3, (index) => GestureDetector(
                onTap: functionOnTap,
                child: Container(
                  height: 10, 
                  width: 10,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle
                  ),
                ),
              ),
            ),
          ),
        ): SizedBox(),
        step == 32 ? 
          StepModule(functionOnTap, 70, 40, 
          top: 140, left: 37,)
          : SizedBox(),
        step == 33 ? Positioned(
          top: 60, 
          left: 117, right: 117,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(2, (index) => GestureDetector(
                onTap: functionOnTap,
                child: Container(
                  height: 70, 
                  width: 45,
                  decoration: BoxDecoration(
                    color: Colors.green,
                  ),
                ),
              ),
            ),
          ),
        ): SizedBox(),
        step == 34 ? 
          StepModule(functionOnTap, 25, 70, 
          top: 80, left: 145, right: 160,)
          : SizedBox(),
        step == 35 ? 
          StepModule(functionOnTap, 10, 30, 
          top: 130, right: 100,)
          : SizedBox(),
        step == 35 ? 
          StepModule(functionOnTap, 10, 30, 
          top: 65, right: 80,)
          : SizedBox(),
        step == 36 ? 
          StepModule(functionOnTap, 20, 30, 
          top: 120, left: 120,)
          : SizedBox(),
        step == 37 ? 
          StepModule(functionOnTap, 25, 40, 
          top: 155, left: 105,)
          : SizedBox(),
        step == 38 ? 
          StepModule(functionOnTap, 20, 35, 
          top: 25, left: 40,)
          : SizedBox(),
        step == 39 ? 
          StepModule(functionOnTap, 35, 25, 
          top: 160, right: 125,)
          : SizedBox(),
        step == 40 ? 
          StepModule(functionOnTap, 20, 80, 
          top: 165, right: 50,)
          : SizedBox(),
        step == 41 ? 
          StepModule(functionOnTap, 20, 50, 
          top: 210, left: 80,)
          : SizedBox(),
        step == 41 ? 
          StepModule(functionOnTap, 20, 50, 
          top: 220, left: 130,)
          : SizedBox(),
      ],
    );
  }
}