import 'package:flutter/material.dart';

class MoreBottomModal extends StatelessWidget {
  final VoidCallback cancleTap;
  const MoreBottomModal({required this.cancleTap, super.key});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          ListTile(
                        leading: Icon(Icons.visibility_off_outlined),
                        title: Text('이 글 숨기기')),
                      ListTile(
                        leading: Icon(Icons.help_outline),
                        title: Text('게시글 노출 기준')),
                      ListTile(
                        leading: Icon(Icons.warning_amber_outlined,
                        color: Colors.red),
                        title: Text('신고하기'),
                        textColor: Colors.red,
                      ),  
                    ],
                  )
                  );
  }
}