import 'package:flutter/material.dart';
import 'package:shoulders/creator.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    const creator = Creator(
      creatorImageUrl:
          'https://filebucket.onefootball.com/2023/5/1684696621150-blob',
      creatorName: 'Her Football Hub',
      followerCount: '137K Followers',
    );
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CreatorProfile(
          creator: creator,
        ),
      ),
    );
  }
}
