import 'package:flutter/material.dart';

class Difficulty extends StatelessWidget {
  final int difficultyLevel;
  const Difficulty({required this.difficultyLevel, Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: 15,
          color: Colors.blueAccent,
        ),
        Icon(
          Icons.star,
          size: 15,
          color:
          (difficultyLevel >= 2) ? Colors.blueAccent : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color:
          (difficultyLevel >= 3) ? Colors.blueAccent : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color:
          (difficultyLevel >= 4) ? Colors.blueAccent : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color:
          (difficultyLevel >= 5) ? Colors.blueAccent : Colors.blue[100],
        ),
      ],
    );
  }
}