//import 'package:car_platform_app/src/controllers/User_Controller.dart';
import 'package:car_platform_app/src/screens/feed/index.dart';
import 'package:car_platform_app/src/screens/nowPrice/ComponentScreen.dart';
import 'package:flutter/material.dart';
import 'package:car_platform_app/src/screens/my/mypage.dart';
import 'package:car_platform_app/src/screens/map/Androidshow.dart';
import 'package:car_platform_app/src/database/my_database.dart';
import 'package:mysql_client/mysql_client.dart';
import 'package:car_platform_app/src/database/mysql_db.dart';
import 'package:car_platform_app/src/controllers/User_Controller.dart';
import 'package:get/get.dart';
import 'package:flutter/widgets.dart';

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
    label: '최근 시세',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.person_outline),
    label: '마이',
  ),
];

// final List<Widget> myTabItems = [
//   FeedIndex(widget.city, widget.country),
//   Androidshow(),
//   ComponentsScreen(),
//   MyPage(),
// ];

class Home extends StatefulWidget {

  final String? country;
  final String? city;

  //const Home({super.key});
  const Home(this.country, this.city,{super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final userController = Get.put(UserController()); // 여기 건드림
  int _selectedIndex = 0;
  late MyDatabase _database;
  var _bConnection = false;
  var _name = 'Database';

  String _currentCity = 'Unknown city';
  String _currentState = 'Unknown state';

  void initState(){
    super.initState();
    userController.myInfo(); // 여기 더추가
    MysqlDb.initializeDB().then((value) => {
      _database = value,
      _name = _database.getName(),
      _bConnection = true,
      print('Connection Success!!'),
      setState(() {})
    });

    // if (widget.city != null && widget.state != null) {
    //   _currentCity = widget.city!;
    //   _currentState = widget.state!;
    // }
  }

  void _onItemTapped(int index){
    setState((){
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> myTabItems = [
      FeedIndex(widget.city, widget.country),
      Androidshow(),
      ComponentsScreen(),
      MyPage(),
    ];

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