import 'package:tobag/components/jd_input.dart';
import 'package:tobag/components/text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart'; 

class RoundedJDEmailFiled extends StatelessWidget {
  final String hintText;
  final IconData icon;
  // final ValueChanged<String> onChaged;
  final dynamic xController;
  const RoundedJDEmailFiled({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.xController,
    //required this.onChaged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: JDInputText(
        hintText: hintText,
        icon: icon,
        xController: xController,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        onChanged: (val) {
          // _email = val;
        },
        validator: (xController) {
          if (xController != null && EmailValidator.validate(xController)) {
            return null;
          }
          return "Invalid email address";
        },
      ),
    );
  }
}
