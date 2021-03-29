import 'package:flutter/material.dart';



// ignore: must_be_immutable
class StepModule extends StatelessWidget {

  Function functionOnTap;
  double top, bottom, left, right;
  double height, width;

  StepModule(this.functionOnTap, this.height, this.width,
    {this.top, this.bottom, this.left, this.right}
  );

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top != null ? top : null, 
      bottom: bottom != null ? bottom : null,
      right: right != null ? right : null,
      left: left != null ? left : null,
      child: GestureDetector(
        onTap: functionOnTap,
        child: Container(
          height: height, width: width, color: Colors.transparent,
        ),
      ),
    );
  }
}