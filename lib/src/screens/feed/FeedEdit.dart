import 'package:car_platform_app/src/controllers/Feed_Controller.dart';
import 'package:car_platform_app/src/screens/feed/FeedCreate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:car_platform_app/src/models/FeedModel.dart';
import 'package:image_picker/image_picker.dart';

class FeedEdit extends StatefulWidget {
  final FeedModel model;
  const FeedEdit(this.model, {super.key});

  @override
  State<FeedEdit> createState() => _FeedEditState();
}

class _FeedEditState extends State<FeedEdit> {
  final feedController = Get.put(FeedController() );
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String _selectedCategory = 'CPU';
  File? image;
  final picker = ImagePicker();

  @override
  void initState(){
    super.initState();
    _titleController.text = widget.model.title;
    _priceController.text = widget.model.price.toString();
    _descriptionController.text = widget.model.content;
    _selectedCategory = widget.model.category;
    image = widget.model.image;
  }

  _submit() async{
    final result = await feedController.feedUpdate(
        widget.model.id,
        _titleController.text,
        _priceController.text,
        _descriptionController.text,
        image,
        _selectedCategory,
    );
    if(result) { Get.back(); }
  }

  Future<void> _getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      } else {
        print('No image selected');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('물품 수정')),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget> [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _priceController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 12.0),
              TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: '설명'),
              maxLines: 3,
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
              const SizedBox(height: 20),
              ElevatedButton(onPressed: () { Get.to(() => const FeedCreate()); },
              child: const Text('수정하기'),
              ),
            ]
          )
        ),
    );
  }
}