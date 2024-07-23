import 'package:car_platform_app/src/models/FeedModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../screens/feed/FeedEdit.dart';
import 'package:car_platform_app/src/screens/feed/FeedCreate.dart';

const double _imageSize = 110;

class FeedListItem extends StatelessWidget {
  final FeedModel model;
  const FeedListItem(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => FeedEdit(model));
      },
        child: Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                    ClipRRect(borderRadius: BorderRadius.circular(10.0),
                    child: Image.file(
                    model.image,
                    width: _imageSize,
                    height: _imageSize,
                    fit: BoxFit.cover,
                    ),
                  ),
              
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            model.title,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 16),                   
                            ),
                          Row(
                            children: [
                              Text('카테고리',
                              style: TextStyle(color: Colors.grey),
                              ),
                              Text(model.category,
                              style: TextStyle(color: Colors.grey),
                              ),
                              ],
                          ),
                          Text(model.price.toString(),
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
              
                  IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.grey,
                    size:16,
                  ),
                )
              ],
              
                
               ),

               Positioned(
                right: 10, bottom: 0,
                child: Row(
                    children:[
                      Icon(
                        Icons.chat_bubble_outline,
                        color: Colors.grey, size: 16),
                      SizedBox(width: 2),
                      Text(
                        '1', style: TextStyle(color: Colors.grey)),
                        SizedBox(width: 4),
                        Icon(
                          Icons.favorite_border,
                          color: Colors.grey, size: 16),
                          SizedBox(width:2),
                          Text('1', style: TextStyle(color: Colors.grey)),
                      ],
                      ),
                    )
                    ],
                  ),
    
    );
  }
}