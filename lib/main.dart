import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'src/app.dart';
import 'package:car_platform_app/src/shared/global.dart';

void main() async{

  //인증 동작
  String token = Global.accessToken;
  bool isLogin = token.isNotEmpty;

  runApp(MyApp(isLogin));
}
