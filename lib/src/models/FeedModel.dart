import 'dart:io';
import 'package:car_platform_app/src/models/UserModel.dart';

class FeedModel{
  late int id;
  late String title;
  late String content;
  late int price;
  late int? imageId;
  DateTime? createdAt;
  bool isMe = false;
  UserModel? writer;

  FeedModel({
    required this.id,
    required this.title,
    required this.content,
    required this.price,
    this.imageId,
    required this.createdAt,
    required this.isMe,
    this.writer,
  });


  FeedModel.parse(Map m) {
    id = m['id'];
    title = m['title'];
    content =m['content'];
    price = m['price'];
    imageId = m['image_id'];
  }

  FeedModel copyWith({
    int? id,
    String? title,
    String? content,
    int? price,
    int? imageId,
    DateTime? createdAt, bool? isMe, UserModel? writer,
  }) {
    return FeedModel(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      price: price ?? this.price,
      imageId: imageId ?? this.imageId,
      isMe: isMe ?? this.isMe,
      writer: writer ?? this.writer,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}