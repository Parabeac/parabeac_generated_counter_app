import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

/// This widget is directly referenced from the "CounterValueText" Component
/// in this demo figma file: https://www.figma.com/file/3XTVGUvPrA5VJTSiXlPVdk/Parabeac-Counter-App-Demo?node-id=1%3A21"
///
/// Because this file is a .g file, developers should avoid writing code in this file.
/// This widget is designed to be reused by both parabeac generated code and developer written code.
/// Parabeac understood that the text value for the text widget should be available to be overriden and can be done by the developer.
/// This is used in counter_value_holder.dart
class CounterValueText extends StatelessWidget {
  final constraints;
  final value;
  CounterValueText(
    this.constraints, {
    Key key,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: constraints.maxWidth * 1.000,
        height: constraints.maxHeight * 1.000,
        child: AutoSizeText(
          value ?? '0',
          style: TextStyle(
            fontFamily: 'Sanchez',
            fontSize: 32.0,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            letterSpacing: 0.0,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ));
  }
}
