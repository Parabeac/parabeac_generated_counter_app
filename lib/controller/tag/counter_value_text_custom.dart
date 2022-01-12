import 'package:flutter/material.dart';

class CounterValueTextCustom extends StatefulWidget {
  final Widget? child;
  final ovrValue;
  CounterValueTextCustom({
    Key? key,
    this.child,
    this.ovrValue,
  }) : super(key: key);

  @override
  _CounterValueTextCustomState createState() => _CounterValueTextCustomState();
}

class _CounterValueTextCustomState extends State<CounterValueTextCustom> {
  @override
  Widget build(BuildContext context) {
    return widget.child!;
  }
}
