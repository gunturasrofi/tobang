import 'package:tobag/Screens/Login/login_screen.dart';
import 'package:tobag/Screens/Signup/components/bacground.dart';
import 'package:tobag/Screens/Signup/components/or_divider.dart';
import 'package:tobag/Screens/Signup/components/social_icon.dart';
import 'package:tobag/components/already_have_an_account.dart';
import 'package:tobag/components/rounded_button.dart';
import 'package:tobag/components/rounded_input_field.dart';
import 'package:tobag/components/rounded_password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  final Widget child;
  const Body({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: size.height * 0.035,
            ),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),
            RoundedInputFiled(
              hintText: "Your Email",
              onChaged: (value) {},
            ),
            RoundedPasswordField(
              onChaged: (value) {},
            ),
            RoundedButton(
              text: "SIGNUP",
              pres: () {},
            ),
            SizedBox(
              height: size.height * 0.035,
            ),
            AlreadyHaveAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocialIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocialIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocialIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
