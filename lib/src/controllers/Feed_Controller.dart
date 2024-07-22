import 'dart:math';
import 'package:car_platform_app/src/screens/feed/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:car_platform_app/src/screens/feed/Feedadd.dart';

class FeedController extends GetxController{
  RxList<Map> feedList = <Map>[].obs;

  @override
  void onInit(){
    super.onInit();
    //_initialData();
  }

  /*_initialData(){
    List<Map> sample  = [
      {'id': 1, 'title': '텀블러', 'content': '팝니다', 'price': 500 , 'category' : 'rom', 'image' : Image.asset('assets/images/logo.png')},
      {'id': 2, 'title': '머그잔',  'content': '교환가능', 'price': 300 , 'category': 'rom', 'image' : Image.asset('assets/images/logo.png')}
    ];
    feedList.assignAll(sample);
  }
  */
 
  void addData(title, description, price, category, image){
    final random = Random();
    final newItem = {
      'id': random.nextInt(100),
      'title': title,
      'description' : description,
      'price' : price,
      'category' : category,
      'image' : image,
    };
    feedList.add(newItem);

    Get.back();

  }

  void updateData(Map newData){
    final id = newData['id'];
    final index = feedList.indexWhere((item) => item['id'] == id);
    if( index != -1) { feedList[index] = newData; }
  }
}