import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

import 'reusabe_card.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 30, left: 30),
              alignment: Alignment.bottomLeft,
              child: const Text('Your Result', style: kTitleTextStyle),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    kResult,
                    style: kResultTextStyle,
                  ),
                  Text(
                    kBMI.toStringAsFixed(1),
                    style: kBMITextStyle,
                  ),
                  Text(
                    kBody,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22.0,
                    ),
                  )
                ],
              ),
              colour: kActiveCardColor,
            ),
          ),
        ],
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const BottomAppBar(
          color: kBottomContainerColor,
          height: kBottomContainerHeight,
          padding: EdgeInsets.only(bottom: 10),
          child: Center(
            child: Text(
              'RE-CALCULATE',
              style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}
