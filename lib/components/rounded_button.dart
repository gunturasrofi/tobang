import 'package:tobag/Screens/Login/login_screen.dart';
import 'package:flutter/material.dart';

import '../costants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function pres;
  final Color color, textColor;

  const RoundedButton({
    Key? key,
    required this.text,
    required this.pres,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          29,
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 40,
            ),
            primary: color,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return LoginScreen();
                },
              ),
            );
          },
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
