import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'CalculatorBrain.dart';
import 'ResultsPage.dart';
import 'cardchild.dart';
import 'constants.dart';
import 'reusabe_card.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // ignore: non_constant_identifier_names
  Gender SelectedGender = Gender.male;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        SelectedGender = Gender.male;
                      },
                    );
                  },
                  child: ReusableCard(
                    colour: SelectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: const cardchild(
                      icon: FontAwesomeIcons.mars,
                      text: 'MALE',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      SelectedGender = Gender.female;
                    });
                  },
                  child: ReusableCard(
                    colour: SelectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: const cardchild(
                      icon: FontAwesomeIcons.venus,
                      text: 'FEMALE',
                    ),
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(
                    child: Text(
                      'HEIGHT',
                      style: kTextLayout,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toStringAsFixed(0),
                        style: kNumberTextLayout,
                      ),
                      const Text(
                        'cm',
                        style: kTextLayout,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Colors.grey,
                      thumbColor: kBottomContainerColor,
                      overlayColor: const Color(0x29EB1555),
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height,
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'WEIGHT',
                        style: kTextLayout,
                      ),
                      Text(
                        weight.toStringAsFixed(0),
                        style: kNumberTextLayout,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            backgroundColor: const Color(0xFF4C4F5E),
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                            child: const Icon(
                              FontAwesomeIcons.minus,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 15.0,
                          ),
                          FloatingActionButton(
                            backgroundColor: const Color(0xFF4C4F5E),
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            child: const Icon(
                              FontAwesomeIcons.plus,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'AGE',
                        style: kTextLayout,
                      ),
                      Text(
                        age.toStringAsFixed(0),
                        style: kNumberTextLayout,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            backgroundColor: const Color(0xFF4C4F5E),
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                            child: const Icon(
                              FontAwesomeIcons.minus,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 15.0,
                          ),
                          FloatingActionButton(
                            backgroundColor: const Color(0xFF4C4F5E),
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                            child: const Icon(
                              FontAwesomeIcons.plus,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
        ],
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          setState(() {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ResultsPage()));
            CalculatorBrain calc =
                CalculatorBrain(height: height, weight: weight);
            calc.getResult();
          });
        },
        child: const BottomAppBar(
          color: kBottomContainerColor,
          height: kBottomContainerHeight,
          padding: EdgeInsets.only(bottom: 10),
          child: Center(
            child: Text(
              'CALCULATE',
              style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
