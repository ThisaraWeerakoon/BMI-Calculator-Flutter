import 'package:bmicalculator/constants.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int height = 150;
  int weight = 70;

  String gender = '';

  late double bmi = calculateBMI(height: height, weight: weight);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      print("male");
                      setState(() {
                        gender = 'M';
                      });
                    },
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: gender == 'M'
                            ? Colors.orange.withAlpha(150)
                            : Colors.orange.withAlpha(50),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Icon(
                            Icons.male,
                            size: 150,
                          ),
                          Text('male'),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      print("female");
                      setState(() {
                        gender = 'F';
                      });
                    },
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: gender == 'F'
                            ? Colors.orange.withAlpha(150)
                            : Colors.orange.withAlpha(50),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Icon(
                            Icons.female,
                            size: 150,
                          ),
                          Text('female'),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text('height'),
                        Text(
                          "$height",
                          style: kInputLabaleColor,
                        ),
                        Row(
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (height < 200) {
                                    height++;
                                  }
                                  bmi = calculateBMI(
                                      height: height, weight: weight);
                                });
                              },
                              child: const Icon(
                                Icons.add,
                                size: 40,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (height > 50) {
                                    height--;
                                  }
                                  bmi = calculateBMI(
                                      height: height, weight: weight);
                                });
                              },
                              child: const Icon(
                                Icons.remove,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text('weight'),
                        Text(
                          "$weight",
                          style: kInputLabaleColor,
                        ),
                        Row(
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (weight < 150) {
                                    weight++;
                                  }
                                  bmi = calculateBMI(
                                      height: height, weight: weight);
                                });
                              },
                              child: const Icon(
                                Icons.add,
                                size: 40,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (weight > 10) {
                                    weight--;
                                  }
                                  bmi = calculateBMI(
                                      height: height, weight: weight);
                                });
                              },
                              child: const Icon(
                                Icons.remove,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  const Text('BMI'),
                  Text(
                    "${bmi.toStringAsFixed(2)}",
                    style: kInputLabaleColor.copyWith(
                      color: kOutputTextColor,
                      fontSize: 60,
                    ),
                  ),
                  Text(getResult(bmi)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  double calculateBMI({required int height, required int weight}) {
    return weight / (height * height) * 10000;
  }

  String getResult(bmiValue) {
    if (bmiValue >= 25) {
      return "Overweight";
    } else if (bmiValue >= 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }
}
