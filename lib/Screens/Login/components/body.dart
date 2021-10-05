// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobag/Screens/Login/components/background.dart';
import 'package:tobag/Screens/MainPage/main_screen.dart';
import 'package:tobag/Screens/Signup/signup_screen.dart';
import 'package:tobag/components/rounded_jd_email_field.dart';
import 'package:tobag/components/rounded_password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:google_fonts/google_fonts.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:get/get.dart';
import 'package:tobag/costants.dart';
// ignore: unused_import
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
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Background(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Text(
              //   "LOGIN",
              //   style: TextStyle(fontWeight: FontWeight.bold),
              // ),
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
              RoundedJDEmailFiled(
                xController: emailController,
                hintText: "Your Email",
              ),
              RoundedPasswordField(
                xController: passwordController,
                onChaged: (value) {},
              ),
              Container(
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
                      primary: kPrimaryColor,
                    ),
                    onPressed: () async {
                      setState(
                        () {
                          isLoading = true;
                        },
                      );
                      await context.read<UserCubit>().signIn(
                            emailController.text,
                            passwordController.text,
                          );

                      UserState state = context.read<UserCubit>().state;
                      if (state is UserLoaded) {
                        Get.to(() =>
                            MainScreen(namex: emailController.toString()));
                      } else {
                        Get.snackbar(
                          "!!!!",
                          "!!!!",
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
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: size.height * 0.03,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Don't have an Account ? ",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => SignUpScreen());
                    },
                    child: Text(
                      "Sign UP",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
