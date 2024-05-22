import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({required this.isActive, super.key});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 5,
      backgroundColor: isActive ? Colors.blue : Colors.grey,
    );
  }
}