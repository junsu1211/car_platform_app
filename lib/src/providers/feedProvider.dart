import 'package:get/get.dart';
import 'provider.dart';
import 'package:car_platform_app/src/shared/global.dart';
import 'dart:io';

class FeedProvider extends Provider {
  /// 피드 리스트 (매물 목록)
  Future<Map> getList({int page = 1}) async {
    Response response = await get(
      '/api/feed',
      query: {'page': '$page'},
      headers: {'Authorization': 'Bearer ${Global.accessToken}'},
    );
    print(response.statusCode);
    print(response.bodyString);
    return response.body;
  }

  Future<Map> index([int page = 1]) async {
    Response response = await get(
      '/api/feed',
      query: {'page': '$page'},
    );
    return response.body;
  }

  Future<Map> store(String title, String price, String content, int? image,
      String category) async {
    final Map<String, dynamic> body = {
      'title': title,
      'price': price,
      'content': content,
      'category': category
    };

    if (image != null) {
      body['image'] = image.toString();
    }

    final response = await post('/api/feed', body);
    return response.body;
  }

  Future<Map> update(
    int id,
    String title,
    String price,
    String content,
    int? image,
    String category,
  ) async {
    final Map<String, dynamic> body = {
      'title': title,
      'price': price,
      'content': content,
      'category': category
    };

    if (image != null) {
      body['image'] = image.toString();
    }

    final response = await put('/api/feed/$id', body);
    return response.body;
  }

  Future<Map> show(int id) async{
  final response= await get('/api/feed/$id');
  return response.body;
  }
 
  Future<Map> destroy(int id) async{
  final response= await delete('/api/feed/$id');
  return response.body;
 }

}
