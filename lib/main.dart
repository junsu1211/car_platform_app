import 'package:flutter/material.dart';
import 'src/app.dart';
import 'package:car_platform_app/src/shared/global.dart';

void main() {
  String token = Global.accessToken;
  bool isLogin = token.isNotEmpty;

  runApp(MyApp(isLogin));
}