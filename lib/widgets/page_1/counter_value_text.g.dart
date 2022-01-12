import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class CounterValueText extends StatelessWidget {
  final constraints;
  final String? ovrValue;
  const CounterValueText(
    this.constraints, {
    Key? key,
    this.ovrValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: constraints.maxWidth * 136.000,
        height: constraints.maxHeight * 29.000,
        child: AutoSizeText(
          ovrValue ?? '0',
          style: TextStyle(
            fontFamily: 'Sanchez',
            fontSize: 32,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            letterSpacing: 0,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ));
  }
}
