import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../screens/feed/FeedEdit.dart';

const double _imageSize = 110;

class FeedListItem extends StatelessWidget {
  final Map item;
  const FeedListItem(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => FeedEdit(item: item));
      },

            child: Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                    ClipRRect(borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzEyMDlfMjM2%2FMDAxNzAyMTA5MDU0MDEy.47lj6fYEYK9sOk1_zja3P5OpqoLRYRxhZbZoWsWDxo0g.zkPJUTBop4ugFckMdJJZu-lJxJDIHNh7qZT9FMIxRA0g.JPEG.mmx041%2F52126057797_442d8064d8_b.jpg&type=sc960_832",
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
                            item['title'],
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 16),                   
                            ),
                          Row(
                            children: [
                              Text('동네이름',
                              style: TextStyle(color: Colors.grey),
                              ),
                              Text(' .N 분전',
                              style: TextStyle(color: Colors.grey),
                              ),
                              ],
                          ),
                          Text(item['price'].toString(),
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