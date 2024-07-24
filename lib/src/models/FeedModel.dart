import 'dart:io';


class FeedModel{
  late int id;
  late String title;
  late String content;
  late int price;
  late File image;
  late String category;

  FeedModel({
    required this.id,
    required this.title,
    required this.content,
    required this.price,
    required this.image,
    required this.category,
  });


  FeedModel.parse(Map m) {
    id = m['id'];
    title = m['title'];
    content =m['content'];
    price = m['price'];
    image = m['image'];
    category = m['category'];
  }

  FeedModel copyWith({
    int? id,
    String? title,
    String? content,
    int? price,
    File? image,
    String? category,
  }) {
    return FeedModel(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      price: price ?? this.price,
      image: image ?? this.image,
      category: category ?? this.category,
    );
  }
}