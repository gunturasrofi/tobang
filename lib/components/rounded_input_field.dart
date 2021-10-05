import 'package:tobag/components/text_field_container.dart';
import 'package:tobag/costants.dart';
import 'package:flutter/material.dart';

class RoundedInputFiled extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChaged;
  final dynamic xController;
  const RoundedInputFiled({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChaged,
    required this.xController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: xController,
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

class RoundedInputNumberFiled extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChaged;
  final dynamic xController;
  const RoundedInputNumberFiled({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChaged,
    required this.xController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: xController,
        onChanged: onChaged,
        keyboardType: TextInputType.number,
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
