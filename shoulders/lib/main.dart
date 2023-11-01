import 'package:flutter/material.dart';
import 'package:shoulders/creator.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  var isBeingFollowed = false;
  var isBeingNotified = false;
  onPressedFollow() {
    setState(() {
      isBeingFollowed = !isBeingFollowed;
      if (!isBeingFollowed) {
        isBeingNotified = false;
      }
    });
  }

  onPressedGetNotified() {
    setState(() {
      isBeingNotified = !isBeingNotified;
    });
  }

  @override
  Widget build(BuildContext context) {
    var creator = Creator(
      creatorImageUrl:
          'https://filebucket.onefootball.com/2023/5/1684696621150-blob',
      creatorName: 'Her Football Hub',
      followerCount: '137K Followers',
      isBeingFollowed: isBeingFollowed,
      isBeingNotified: isBeingNotified,
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CreatorProfile(
          creator: creator,
          onPressedFollow: onPressedFollow,
          onPressedGetNotified: onPressedGetNotified,
        ),
      ),
    );
  }
}
