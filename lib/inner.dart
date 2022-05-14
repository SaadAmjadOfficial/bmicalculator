import 'package:flutter/material.dart';

class Inner extends StatelessWidget {
  final IconData ic;
  final String tex;
  // ignore: use_key_in_widget_constructors
  const Inner({required this.ic, required this.tex});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          ic,
          size: 80,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          tex,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        )
      ],
    );
  }
}