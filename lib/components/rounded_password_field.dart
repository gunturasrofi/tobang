import 'package:tobag/components/text_field_container.dart';
import 'package:flutter/material.dart';

import '../costants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChaged;
  final dynamic xController;
  const RoundedPasswordField({
    Key? key,
    required this.onChaged,
    required this.xController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: xController,
        obscureText: true,
        onChanged: onChaged,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.visibility,
              color: kPrimaryColor,
            ),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
