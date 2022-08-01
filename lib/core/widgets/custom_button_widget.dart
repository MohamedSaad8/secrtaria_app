import 'package:flutter/material.dart';
import '../constants/constant.dart';



class CustomButton extends StatelessWidget {
  final double buttonWidth ;
  final double buttonHeight;
  final double buttonMargin;
  final double buttonTextFontSize;
  final String buttonText;
  final FontWeight buttonFontWight;
  final double buttonBorderRadius ;
  final VoidCallback buttonAction;

  const CustomButton({
    super.key,
    required this.buttonWidth  ,
    required this.buttonHeight,
    required this.buttonMargin,
    required this.buttonTextFontSize,
    required this.buttonText,
     this.buttonFontWight = FontWeight.bold,
    required this.buttonAction,
     this.buttonBorderRadius = 20,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonAction,
      child: Container(
        width: buttonWidth,
        margin: EdgeInsets.all(buttonMargin),
        height: buttonHeight,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(buttonBorderRadius),
          border: Border.all(
            color: Constant.kMainColor
          )
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
                color: Constant.kMainColor,
                fontSize: buttonTextFontSize,
                fontWeight: buttonFontWight),
          ),
        ),
      ),
    );
  }
}
