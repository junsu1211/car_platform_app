import 'dart:io';


class FeedModel{
  late int id;
  late String title;
  late String content;
  late double price;
  late File? image;
  late String category;

  FeedModel.parse(Map m) {
    id = m['id'];
    title = m['title'];
    content =m['content'];
    price = m['price'];
    category = m['category'];
    image = m['image'];
  }

}