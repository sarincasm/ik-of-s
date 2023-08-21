import 'package:flutter/material.dart';

class CreatorProfile extends StatelessWidget {
  const CreatorProfile({super.key});

  @override
  Widget build(BuildContext context) {
    var backgroundColor =
        (const HSLColor.fromAHSL(1.0, 206.5, .607, .89)).toColor();
    return Container(
      color: backgroundColor,
    );
  }
}
