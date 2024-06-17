import 'package:flutter/material.dart';

ElevatedButton mainButton(
  {
    String buttonText = '',
    Function()? buttonFunction,
    Color buttonColor = Colors.blue,
    Color textButtonColor = const Color.fromARGB(255, 255, 255, 255),
  }
) {
  return ElevatedButton(
    onPressed: buttonFunction, 
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(buttonColor),
      foregroundColor: MaterialStateProperty.all(textButtonColor),
      padding: const MaterialStatePropertyAll<EdgeInsetsGeometry>
      (
        EdgeInsets.symmetric
        (
          horizontal: 30,
          vertical: 15
        ),
      ),
      shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        )
      )
    ),
    child: Text(buttonText),
  );
}