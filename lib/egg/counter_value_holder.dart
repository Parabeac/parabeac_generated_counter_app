import 'package:flutter/material.dart';
import 'package:temp/models/counter_cubit.dart';
import 'package:temp/widgets/page_1/counter_value_text.g.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// This class is responsible for presenting the amount of times the + button was clicked.
///
/// *Because this class was generated as a normal dart file, Parabeac will no longer touch this file.
/// This means that developers can create whatever they'd like here & Parabeac will reference this when needed.*
class CounterValueHolder extends StatefulWidget {
  final Widget child;
  CounterValueHolder({Key key, this.child}) : super(key: key);

  @override
  _CounterValueHolderState createState() => _CounterValueHolderState();
}

class _CounterValueHolderState extends State<CounterValueHolder> {
  @override
  Widget build(BuildContext context) {
    /// * This was hand-written by Parabeac developers and was not generated by Parabeac-Core. *
    return LayoutBuilder(builder: (context, constraints) {
      /// Here, we take advantage of 'CounterValueText' which is a component created in the main figma file:
      /// https://www.figma.com/file/3XTVGUvPrA5VJTSiXlPVdk/Parabeac-Counter-App-Demo?node-id=0%3A1
      ///
      /// Because we are leveraging the component, designers can continue to change the component
      /// without breaking the logic written by the developer in this class.
      return CounterValueText(
        constraints,

        /// Here we assign the value for the text to display for a Cubit that the developer has created.
        value: context.watch<CounterCubit>().state.toString(),
      );
    });
  }
}
