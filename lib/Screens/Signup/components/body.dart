import 'package:google_fonts/google_fonts.dart';
import 'package:tobag/Screens/MainPage/main_screen.dart';
import 'package:tobag/Screens/Signup/components/bacground.dart';
// import 'package:tobag/Screens/Signup/components/or_divider.dart';
// import 'package:tobag/Screens/Signup/components/social_icon.dart';
import 'package:tobag/components/rounded_input_field.dart';
import 'package:tobag/components/rounded_password_field.dart';
import 'package:flutter/material.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:get/get.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:get/get_core/src/get_main.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobag/costants.dart';
import 'package:tobag/cubit/cubit.dart';

class BodySignUp extends StatefulWidget {
  final Widget child;
  const BodySignUp({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  _BodySignUpState createState() => _BodySignUpState();
}

class _BodySignUpState extends State<BodySignUp> {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController hpController = TextEditingController();
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
              "SIGNUP",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: size.height * 0.035,
            ),
            // SvgPicture.asset(
            //   "assets/icons/signup.svg",
            //   height: size.height * 0.35,
            // ),
            RoundedInputFiled(
              xController: firstnameController,
              hintText: "Fist Name",
              onChaged: (value) {},
            ),
            RoundedInputFiled(
              xController: lastnameController,
              hintText: "Last Name",
              onChaged: (value) {},
            ),
            RoundedInputFiled(
              xController: emailController,
              icon: Icons.alternate_email,
              hintText: "Your Email",
              onChaged: (value) {},
            ),
            RoundedInputNumberFiled(
              xController: hpController,
              icon: Icons.ad_units_rounded,
              hintText: "Phone Number",
              onChaged: (value) {},
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
                    setState(() {
                      isLoading = true;
                    });

                    await context.read<UserCubit>().signUp(
                          firstnameController.text,
                          lastnameController.text,
                          emailController.text,
                          hpController.text,
                          passwordController.text,
                        );

                    UserState state = context.read<UserCubit>().state;
                    String success = (state as UserSignUp).message.toString();

                    if (success == "success") {
                      //UserSignUp.message
                      await context.read<UserCubit>().signIn(
                            emailController.text,
                            passwordController.text,
                          );

                      UserState state = context.read<UserCubit>().state;
                      if (state is UserLoaded) {
                        Get.to(() =>
                            MainScreen(namex: firstnameController.toString()));
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
                            "SignUp Failed",
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
                          "SignUp Failed",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        messageText: Text(
                          // ignore: unnecessary_cast
                          (state as UserSignUp).message.toString(),
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
                    "SignUp",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.035,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Already have an Account ? ",
                  style: TextStyle(color: kPrimaryColor),
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Text(
                    "Sign IN",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
