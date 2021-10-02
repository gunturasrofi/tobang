import 'package:tobag/components/text_field_container.dart';
import 'package:tobag/costants.dart';
import 'package:flutter/material.dart';

class RoundedInputFiled extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChaged;
  const RoundedInputFiled({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChaged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChaged,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
