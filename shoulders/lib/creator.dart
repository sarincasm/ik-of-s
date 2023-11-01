import 'dart:ui';

import 'package:flutter/material.dart';

class Creator {
  final String creatorName;
  final String creatorImageUrl;
  final String followerCount;
  final bool isBeingFollowed;

  const Creator({
    required this.creatorName,
    required this.creatorImageUrl,
    required this.followerCount,
    required this.isBeingFollowed,
  });
}

class CreatorProfile extends StatelessWidget {
  const CreatorProfile({
    super.key,
    required this.creator,
    required this.onPressedFollow,
  });

  final Creator creator;
  final Function onPressedFollow;

  @override
  Widget build(BuildContext context) {
    var backgroundColor =
        (const HSLColor.fromAHSL(1.0, 206.5, .607, .89)).toColor();
    var buttonBackgroundColor =
        creator.isBeingFollowed ? Colors.white : Colors.transparent;
    var textColor = creator.isBeingFollowed ? Colors.black87 : Colors.white;
    var buttonText = creator.isBeingFollowed ? 'Following' : 'Follow';

    return Container(
      color: backgroundColor,
      width: double.infinity,
      child: Column(
        children: [
          Container(
            height: 550,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  creator.creatorImageUrl,
                ),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5),
                  BlendMode.darken,
                ),
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 70, sigmaY: 60),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(height: 120),
                    CircleAvatar(
                      radius: 75,
                      backgroundImage: NetworkImage(
                        creator.creatorImageUrl,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      creator.creatorName,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      creator.followerCount,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            onPressedFollow();
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: buttonBackgroundColor,
                            side: const BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              buttonText.toUpperCase(),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: textColor,
                              ),
                            ),
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                            shape: const CircleBorder(),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(
                              Icons.notification_add_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Column(
            children: [
              Text(
                'Latest from ${creator.creatorName}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
