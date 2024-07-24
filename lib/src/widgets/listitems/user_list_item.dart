import 'package:flutter/material.dart';
 import 'package:car_platform_app/src/models/UserModel.dart';
 
class UserListItem extends StatelessWidget {
 final UserModel user;
 const UserListItem(this.user, {super.key});
 
 @override
 Widget build(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      border: Border(
      bottom: BorderSide(color: Colors.grey.shade200),
      ),
    ),
    child: Row(
    children: [
    CircleAvatar(backgroundImage: NetworkImage(user.profileUrl)),
    const SizedBox(width: 10),
    Text(user.name),
    ],
    ),
  );
 }
<<<<<<< HEAD
}
=======
}
>>>>>>> d15a2d2354f78c40aa4816d441876438b1e929bf
