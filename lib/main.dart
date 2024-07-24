import 'package:flutter/material.dart';
import 'src/app.dart';
<<<<<<< HEAD

void main() {
  runApp(const MyApp());
}
=======
import 'package:car_platform_app/src/shared/global.dart';

void main() {
  String token = Global.accessToken;
  bool isLogin = token.isNotEmpty;

  runApp(MyApp(isLogin));
}
>>>>>>> 1703295b2e1bea4bb1879345a2b2770a46c90613
