import 'dart:math';
import 'package:car_platform_app/src/shared/data.dart';
import 'package:get/get.dart';

import 'package:car_platform_app/src/controllers/Feed_Controller.dart';
import 'package:car_platform_app/src/widgets/buttons/category_button.dart';
import 'package:car_platform_app/src/widgets/listitems/feed_list_item.dart';
import 'package:flutter/material.dart';
import 'package:car_platform_app/src/screens/feed/Feedadd.dart';

class FeedIndex extends StatefulWidget {
  const FeedIndex({super.key});

  @override
  State <FeedIndex> createState() =>  _FeedIndexState();
}

class  _FeedIndexState extends State<FeedIndex> {
final feedController = Get.put(FeedController());

  
  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () { Get.to(() => const Feedadd()); },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        centerTitle: false,
        title: const Text('내 동네'),
        actions: [
          IconButton(
            onPressed: () {}, //검색 버튼 처리
            icon: const Icon(Icons.search),
          ),
          IconButton(onPressed: () {}, // 알림 버튼 처리
           icon: const Icon(Icons.notifications_none_rounded),
           ),
        ],
      ),

      body: Column(
        children: [
        SizedBox(height: 40),
        Expanded(
        child: Obx(
         () => ListView.builder(
          itemCount: feedController.feedList.length,
          itemBuilder: (context, index) {
            final item = feedController.feedList[index];
            return FeedListItem(item);
          },
         ),
          
          ),)
        ],
      ),



  );

  }
}