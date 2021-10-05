// ignore: import_of_legacy_library_into_null_safe
import 'package:get/get.dart';
import 'package:tobag/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'background.dart';
import 'package:flutter_svg/svg.dart';

class BodyMainPage extends StatelessWidget {
  final String name;
  BodyMainPage({required this.name});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Welcome  to Toko Bagus",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.45,
            ),
            RoundedButton(
              text: "LOGOUT",
              pres: () {
                Get.back();
              },
            )
          ],
        ),
      ),
    );
  }
}
