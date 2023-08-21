import 'package:flutter/material.dart';

class CreatorProfile extends StatelessWidget {
  const CreatorProfile({super.key});

  @override
  Widget build(BuildContext context) {
    var backgroundColor =
        (const HSLColor.fromAHSL(1.0, 206.5, .607, .89)).toColor();
    return Container(
      color: backgroundColor,
      width: double.infinity,
      child: const Column(children: [
        SizedBox(height: 120),
        CircleAvatar(
          radius: 75,
          backgroundImage: NetworkImage(
            'https://filebucket.onefootball.com/2023/5/1684696621150-blob',
          ),
        ),
        SizedBox(height: 30),
        Text(
          'Her Football Hub',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        Text(
          '137K Followers',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        )
      ]),
    );
  }
}
