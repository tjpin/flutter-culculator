import 'package:flutter/material.dart';

class Mybuttons extends StatelessWidget {
  final color;
  final textColor;
  final String buttonText;
  final buttonTapped;

  Mybuttons({this.color, this.textColor, this.buttonText, this.buttonTapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              color: color,
              child: Center(
                child: Text(
                  buttonText,
                  style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 27,
                      color: textColor),
                ),
              ),
            )),
      ),
    );
  }
}
