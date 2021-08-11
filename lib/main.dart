import 'package:flutter/material.dart';
import 'package:flutter_instagram_custom_ui/views/login_screen.dart';
import 'package:flutter_instagram_custom_ui/constants/constants.dart';

void main() {
  runApp(MyApp());
}

ConstantColors constantColors = ConstantColors();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          accentColor: constantColors.secondaryColor),
      home: LoginScreen(),
    );
  }
}
