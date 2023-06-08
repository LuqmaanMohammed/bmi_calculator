import 'package:flutter/material.dart';

import 'constants.dart';

// ignore: camel_case_types
class cardchild extends StatelessWidget {
  const cardchild({
    super.key,
    required this.icon,
    required this.text,
  });
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
          color: Colors.white,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          text,
          style: kTextLayout,
        )
      ],
    );
  }
}
