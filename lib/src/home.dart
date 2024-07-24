import 'package:car_platform_app/src/screens/feed/index.dart';
import 'package:flutter/material.dart';
import 'package:car_platform_app/src/screens/my/mypage.dart';
import 'package:car_platform_app/src/screens/map/Androidshow.dart';
import 'package:car_platform_app/src/database/my_database.dart';
import 'package:mysql_client/mysql_client.dart';
import 'package:car_platform_app/src/database/mysql_db.dart';

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

class Home extends StatefulWidget {
  final String? city;
  final String? state;

  const Home({super.key, this.city, this.state});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  late MyDatabase _database;
  var _bConnection = false;
  var _name = 'Database';

  String _currentCity = '내 동네';
  String _currentState = '';

  @override
  void initState() {
    super.initState();
    MysqlDb.initializeDB().then((value) => {
      _database = value,
      _name = _database.getName(),
      _bConnection = true,
      print('Connection Success!!'),
      setState(() {})
    });

    if (widget.city != null && widget.state != null) {
      _currentCity = widget.city!;
      _currentState = widget.state!;
    }
  }

  void _onItemTapped(int index) {
    setState(() {
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
        children: [
          FeedIndex(city: _currentCity, state: _currentState), // 시, 도 정보를 전달
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Androidshow()),
            ],
          ),
          Center(child: Text('채팅')),
          MyPage(),
        ],
      ),
    );
  }
}
