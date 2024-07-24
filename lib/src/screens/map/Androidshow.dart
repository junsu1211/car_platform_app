import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class Androidshow extends StatefulWidget {
  const Androidshow({Key? key}) : super(key: key);

  @override
  State<Androidshow> createState() => _AndroidshowState();
}

class _AndroidshowState extends State<Androidshow> {

  late GoogleMapController mapController;
  LatLng _selectedPosition = LatLng(37.7749, 128.4194); // 초기 위치는 서울 설정

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _onMapTap(LatLng position) {
    setState(() {
      _selectedPosition = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('구글 맵 위치 설정'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _selectedPosition,
          zoom: 12.0,
        ),
        onTap: _onMapTap,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // 사용자가 선택한 위치를 이용하여 원하는 작업 수행
          print('Selected position: $_selectedPosition');
          // 여기에 원하는 추가 작업을 추가할 수 있습니다.
        },
        label: const Text('위치 설정 완료'),
        icon: const Icon(Icons.map),
      ),
    );
  }
}
