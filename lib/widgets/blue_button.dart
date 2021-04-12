import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {
  String text;
  Function onPressed;

  BlueButton(this.text, {@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}
