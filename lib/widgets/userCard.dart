import 'package:flutter/material.dart';
import 'package:tictactoe/constants.dart';

class userCard extends StatelessWidget {
  final String userName;
  final String path;
  final Color color;
  const userCard({
    super.key,  required this.userName,  required this.path, required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: lightPrimary,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Stack(
              children: [Container(
                height: 80,
                width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: color,
                  )
              ),userName == "User 1" ?Image(image: AssetImage("assets/x.png"),height: 80,width: 80,):Image(image: AssetImage("assets/o.png"),height: 80,width: 80,),]
            ),
            SizedBox(height: 10,),
            Column(
              children: [Text(userName)],
            )
          ],
        ),
      ),
    );
  }
}
