import 'dart:io';

import 'package:car_platform_app/src/widgets/listitems/feed_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:car_platform_app/src/controllers/Feed_Controller.dart';
import 'dart:math';

class FeedCreate extends StatefulWidget {
  const FeedCreate({Key? key}) : super(key: key);

  @override
  State<FeedCreate> createState() => _FeedCreateState();
}

class _FeedCreateState extends State<FeedCreate> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final feedController = Get.put(FeedController());

  String _selectedCategory = 'CPU';

  File? _image;
  String? image;

  final picker = ImagePicker();

  _submit() async{
     if (_image != null ) {
      // Upload image logic goes here
      print('Uploading image: ${_image!.path}');
    } else {
      print('No image selected');
    }
    final result = await feedController.feedCreate(
      _titleController.text,
      _priceController.text,
      _descriptionController.text,
      image,
      _selectedCategory);
      if(result){
        Get.back();
      }
  }

  Future<void> _getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        image = pickedFile.path;
      } else {
        print('No image selected');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('피드 등록'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: '제목'),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: '설명'),
              maxLines: 3,
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _priceController,
              decoration: InputDecoration(labelText: '가격'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12.0),
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCategory = newValue!;
                });
              },
              items: <String>[
                'CPU',
                'GPU',
                'RAM',
                'Mainboard',
                'Storage',
                'Power',
                'Case',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: '카테고리',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: _getImage,
              child: const Text('사진 추가'),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: _submit,
              child: const Text('부품 등록'),
            ),
            const SizedBox(height: 12.0),
            _image != null
                ? Image.file(_image!, fit: BoxFit.contain, height: MediaQuery.of(context).size.height* 0.2,) 
                : const Text('사진을 선택하세요'),
          ],
        ),
      ),
    );
  }
}

