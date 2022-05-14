import 'package:bmicalculator/cal.dart';
import 'package:bmicalculator/reuse_card.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const Result({required this.val, required this.tex, required this.para});
  final double val;
  final String tex;
  final String para;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI Calculator Result",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: const Text(
              "Your Result",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            ),
          ),
          Expanded(
            child: Reusecard(
              colour: actClr,
              cardchild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                    child: Text(
                      tex,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.greenAccent,
                          fontSize: 25),
                    ),
                  ),
                  Center(
                    child: Text(
                      val.toStringAsFixed(1),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 60),
                    ),
                  ),
                  Center(
                    child: Text(
                      para,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              alignment: Alignment.center,
              color: Colors.blue[700],
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Re-Calculate",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
