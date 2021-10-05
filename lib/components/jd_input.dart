import 'package:flutter/material.dart';
import 'package:tobag/costants.dart';

class JDInputText extends StatelessWidget {
  const JDInputText({
    required this.onChanged,
    required this.hintText,
    this.validator,
    this.obscureText = false,
    this.keyboardType,
    this.suffixIcon,
    this.textInputAction,
    required this.icon,
    required this.xController,
  });
  final Function(String?) onChanged;
  final String? Function(String?)? validator;
  final String hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;
  final IconData icon;
  final dynamic xController;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: obscureText,
        validator: validator,
        onChanged: onChanged,
        controller: xController,
        keyboardType: keyboardType ?? TextInputType.text,
        textInputAction: textInputAction,
        decoration: new InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ));
  }
}

class JDInputPassword extends StatelessWidget {
  const JDInputPassword({
    required this.onChanged,
    required this.hintText,
    this.validator,
    this.obscureText = false,
    this.keyboardType,
    this.suffixIcon,
    this.textInputAction,
    required this.icon,
    required this.xController,
  });
  final Function(String?) onChanged;
  final String? Function(String?)? validator;
  final String hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;
  final IconData icon;
  final dynamic xController;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: obscureText,
        validator: validator,
        onChanged: onChanged,
        controller: xController,
        keyboardType: keyboardType ?? TextInputType.text,
        textInputAction: textInputAction,
        decoration: new InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ));
  }
}





// /// Password input
//    JDInputTexta(
//     obscureText: !_visiblePassword,
//     hintText: 'Enter Password',
//     textInputAction: TextInputAction.done,
//     keyboardType: TextInputType.visiblePassword,
//     onChanged: (val) {
//       _password = val;
//     },
//     validator: (password) {
//       if (password == null || password.length == 0) {
//         return "Empty password";
//       }
//       return null;
//     },
//     suffixIcon: InkWell(
//       onTap: () {
//         setState(() {
//           _visiblePassword = !_visiblePassword;
//         });
//       },
//       child: Icon(
//         _visiblePassword
//             ? Icons.visibility_off
//             : Icons.visibility,
//         color: Theme.of(context).primaryColor,
//       ),
//     ),
//   ),