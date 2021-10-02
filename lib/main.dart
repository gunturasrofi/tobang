// ignore: import_of_legacy_library_into_null_safe
import 'package:get/get.dart';
import 'package:tobag/costants.dart';
import 'package:flutter/material.dart';

import 'costants.dart';

import 'Screens/Welcome/welcome_screen.dart';
// import 'package:flutter/services.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobag/cubit/cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => UserCubit(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: kPrimaryColor,
        ),
        home: WelcomeSreen(),
      ),
    );
  }
}
