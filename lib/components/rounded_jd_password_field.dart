import 'package:tobag/components/jd_input.dart';
import 'package:tobag/components/text_field_container.dart';
import 'package:flutter/material.dart';

class RoundedJDPasswordField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  // final ValueChanged<String> onChaged;
  final dynamic xController;
  const RoundedJDPasswordField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.xController,
    //required this.onChaged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // bool _visiblePassword = false;
    return TextFieldContainer(
      child: JDInputText(
        hintText: hintText,
        icon: icon,
        xController: xController,
        keyboardType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.next,
        onChanged: (val) {
          //_password = val;
        },
        validator: (password) {
          if (password == null || password.length == 0) {
            return "Empty password";
          }
          return null;
        },
        suffixIcon: InkWell(
          onTap: () {
            // setState(() {
            //   _visiblePassword = !_visiblePassword;
            // });
          },
          // child: Icon(
          //   _visiblePassword ? Icons.visibility_off : Icons.visibility,
          //   color: Theme.of(context).primaryColor,
          // ),
        ),
      ),
    );
  }
}
