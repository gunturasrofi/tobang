// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:tobag/Screens/Login/components/background.dart';
import 'package:tobag/Screens/MainPage/main_screen.dart';
import 'package:tobag/Screens/Signup/signup_screen.dart';
import 'package:tobag/components/already_have_an_account.dart';
import 'package:tobag/components/rounded_button.dart';
import 'package:tobag/components/rounded_input_field.dart';
import 'package:tobag/components/rounded_password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:tobag/cubit/user_cubit.dart';

class BodyLogin extends StatefulWidget {
  const BodyLogin({Key? key}) : super(key: key);

  @override
  _BodyLoginState createState() => _BodyLoginState();
}

class _BodyLoginState extends State<BodyLogin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedInputFiled(
              hintText: "Your Email",
              onChaged: (value) {},
            ),
            RoundedPasswordField(
              onChaged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              pres: () async {
                setState(
                  () {
                    isLoading = true;
                  },
                );

                await context.watch<UserCubit>().signIn(
                      emailController.text,
                      passwordController.text,
                    );

                UserState state = context.watch<UserCubit>().state;
                if (state is UserLoaded) {
                  Get.to(() => MainScreen());
                } else {
                  Get.snackbar(
                    "",
                    "",
                    backgroundColor: Colors.red[400],
                    icon: Icon(
                      MdiIcons.closeCircleOutline,
                      color: Colors.white,
                    ),
                    titleText: Text(
                      "Sign In Failed",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    messageText: Text(
                      (state as UserLoadingFailed).message,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                      ),
                    ),
                  );
                  setState(
                    () {
                      isLoading = false;
                    },
                  );
                }
              },
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            AlreadyHaveAccountCheck(
              press: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return SignUpScreen();
                //     },
                //   ),
                // );
                Get.to(() => SignUpScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
