import 'package:car_platform_app/src/screens/register.dart';
import 'package:car_platform_app/src/shared/data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:car_platform_app/src/screens/login.dart';

import 'feed/show.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //로고 & 슬로건 영역
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //로고
                  Image.asset('assets/images/logo.png', width: 300, height: 300),
                  //슬로건
                  const SizedBox(height: 20),
                  const Text(
                    'Easy Computer Upgrade',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    '생각만 했던 컴퓨터 업그레이드\n 지금 당신의 주변에서 쉽게 시작하세요!',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          // 가입, 로그인 버튼 영역
          Column(
            children: [
              //회원가입
              Padding(padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  ElevatedButton(onPressed: () {
                    Get.to( () => const Register());
                  },
                  child: const Text('시작하기'),
                  ),
                  //로그인
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('이미 계정이 있나요?'),
                      TextButton(
                        onPressed: () {
                          Get.to(() => const Login());
                        },
                        child: const Text('로그인'),
                      )
                    ],
                  ),
                ],
              ),
              ),    //로그인
            ],
          ),
        ],
      ),
    );
  }
}
