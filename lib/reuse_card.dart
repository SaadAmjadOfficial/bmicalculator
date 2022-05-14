import 'package:flutter/material.dart';

class Reusecard extends StatelessWidget {
  final Color colour;
  final Widget cardchild;
  // ignore: use_key_in_widget_constructors
  const Reusecard({required this.colour, required this.cardchild});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardchild,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: colour,
      ),
    );
  }
}