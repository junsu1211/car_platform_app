import 'package:car_platform_app/src/screens/feed/index.dart';
import 'package:flutter/material.dart';
import 'package:car_platform_app/src/screens/my/mypage.dart';
import 'package:car_platform_app/src/screens/map/Androidshow.dart';


final List<BottomNavigationBarItem> myTabs  = [
  BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: '홈',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.feed),
    label: '동네',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.chat_bubble_outline_rounded),
    label: '채팅',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.person_outline),
    label: '마이',
  ),
];

final List<Widget> myTabItems = [
  FeedIndex(),
  Androidshow(),
  Center(child: Text('채팅')),
  MyPage(),
];

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _onItemTapped(int index){
    setState((){
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: myTabs,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped, 
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: myTabItems,
      ),
    );
  }
}