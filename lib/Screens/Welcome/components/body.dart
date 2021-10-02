// ignore: import_of_legacy_library_into_null_safe
import 'package:get/get.dart';
import 'package:tobag/Screens/Login/login_screen.dart';
import 'package:tobag/components/rounded_button.dart';
import 'package:tobag/costants.dart';
import 'package:flutter/material.dart';
import 'background.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Welcome to my Aplication..",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            SvgPicture.asset(
              "assets/icons/chat.svg",
              height: size.height * 0.45,
            ),
            RoundedButton(
              text: "LOGIN",
              pres: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return LoginScreen();
                //     },
                //   ),
                // );
                Get.to(() => LoginScreen());
              },
            ),
            RoundedButton(
              text: "SIGN UP",
              pres: () {},
              color: kPrimaryLighColor,
              textColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
