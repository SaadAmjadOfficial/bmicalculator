import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reuse_card.dart';
import 'inner.dart';
import 'result.dart';
import 'brain.dart';

const actClr = Color(0xFF1D1E33);
const inactClr = Color(0xff111328);

enum Gen {
  male,
  female,
  non,
}

class Cal extends StatefulWidget {
  const Cal({Key? key}) : super(key: key);

  @override
  _CalState createState() => _CalState();
}

class _CalState extends State<Cal> {
  Gen G = Gen.non;
  double Height = 5.4;
  int w8 = 58;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "My BMI Calculator",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        G = Gen.male;
                      });
                    },
                    child: Reusecard(
                      colour: G == Gen.male ? actClr : inactClr,
                      cardchild: const Inner(
                        ic: FontAwesomeIcons.mars,
                        tex: "Male",
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        G = Gen.female;
                      });
                    },
                    child: Reusecard(
                      colour: G == Gen.female ? actClr : inactClr,
                      cardchild: const Inner(
                        ic: FontAwesomeIcons.venus,
                        tex: "Female",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Reusecard(
              colour: actClr,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Height",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        Height.toStringAsFixed(1),
                        style: const TextStyle(
                            fontSize: 45, fontWeight: FontWeight.w900),
                      ),
                      const Text(
                        "ft",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Colors.blue[600],
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 12),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 25),
                      overlayColor: Colors.blue[300],
                      activeTrackColor: Colors.blue[400],
                      inactiveTrackColor: Colors.grey,
                    ),
                    child: Slider(
                        value: Height,
                        min: 2,
                        max: 8,
                        onChanged: (double val) {
                          setState(() {
                            Height = val;
                          });
                        }),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Reusecard(
                    colour: actClr,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Weight",
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              w8.toString(),
                              style: const TextStyle(
                                  fontSize: 45, fontWeight: FontWeight.w900),
                            ),
                            const Text(
                              "kg",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.grey[700],
                                shape: const CircleBorder(),
                              ),
                              onPressed: () {
                                setState(() {
                                  w8--;
                                });
                              },
                              child: const Icon(Icons.remove),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.grey[700],
                                shape: const CircleBorder(),
                              ),
                              onPressed: () {
                                setState(() {
                                  w8++;
                                });
                              },
                              child: const Icon(Icons.add),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Reusecard(
                    colour: actClr,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Age",
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              age.toString(),
                              style: const TextStyle(
                                  fontSize: 45, fontWeight: FontWeight.w900),
                            ),
                            const Text(
                              "years",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.grey[700],
                                shape: const CircleBorder(),
                              ),
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              child: const Icon(Icons.remove),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.grey[700],
                                shape: const CircleBorder(),
                              ),
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: const Icon(Icons.add),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Brain cal = Brain(height: Height, w8: w8);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Result(
                  val: cal.bmiVal(), tex: cal.bmiTex(), para: cal.bmiPara(),
                )),
              );
            },
            child: Container(
              alignment: Alignment.center,
              color: Colors.blue[700],
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Calculate",
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
