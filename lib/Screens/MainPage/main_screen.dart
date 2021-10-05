import 'package:flutter/material.dart';
import 'package:tobag/Screens/MainPage/components/body.dart';

class MainScreen extends StatelessWidget {
  final String namex;
  const MainScreen({required this.namex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyMainPage(
        name: namex,
      ),
    );
  }
}
