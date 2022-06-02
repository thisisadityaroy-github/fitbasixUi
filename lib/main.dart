import 'package:fitbasix/view/main_screen.dart';
import 'package:flutter/material.dart';
import "package:get/get.dart";

void main() => runApp(const Fitbasix());

class Fitbasix extends StatelessWidget {
  const Fitbasix({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
