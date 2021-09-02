import 'package:flutter/material.dart';
import 'package:temp/widgets/responsive_orientation_builder.g.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:temp/egg/counter_button.dart';
import 'package:temp/egg/counter_value_holder.dart';
import 'package:temp/widgets/page_1/counter_value_text.g.dart';

/// This screen is directly referenced from the "MyAppScreen"
/// in this demo figma file: https://www.figma.com/file/3XTVGUvPrA5VJTSiXlPVdk/Parabeac-Counter-App-Demo?node-id=1%3A21"
///
/// Because this file is a .g file, developers should avoid writing code in this file.
/// This screen contains functionality, developers can write this logic by leveraging <custom> tags.
/// See counter_value_holder.dart & counter_value.dart.
class MyAppScreen extends StatefulWidget {
  const MyAppScreen() : super();
  @override
  _MyAppScreen createState() => _MyAppScreen();
}

class _MyAppScreen extends State<MyAppScreen> {
  _MyAppScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff3598fb),
        title: IconButton(
            icon: Container(
                child: AutoSizeText(
              'Flutter Demo Home Page',
              style: TextStyle(
                fontFamily: 'Sanchez',
                fontSize: 21.0,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                letterSpacing: 0.0,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            )),
            onPressed: () {
              // TODO: Fill action
            }),
      ),
      body: Stack(children: [
        Positioned(
          left: MediaQuery.of(context).size.width * 0.728,
          width: MediaQuery.of(context).size.width * 0.187,
          top: MediaQuery.of(context).size.height * 0.766,
          height: MediaQuery.of(context).size.height * 0.086,
          child: CounterButton(
              child: Stack(children: [
            Positioned(
              left: 0,
              width: 70.0,
              top: 0,
              height: 70.0,
              child: Image.asset(
                'assets/images/1_134.png',
              ),
            ),
            Positioned(
              left: 14.0,
              width: 41.0,
              top: 0,
              height: 70.0,
              child: Container(
                  child: AutoSizeText(
                '+',
                style: TextStyle(
                  fontFamily: 'Sanchez',
                  fontSize: 48.0,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 0.0,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              )),
            ),
          ])),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width * 0.101,
          width: MediaQuery.of(context).size.width * 0.763,
          top: MediaQuery.of(context).size.height * 0.357,
          height: MediaQuery.of(context).size.height * 0.117,
          child: Container(
              child: AutoSizeText(
            'You have pushed the button this many times:',
            style: TextStyle(
              fontFamily: 'Sanchez',
              fontSize: 21.0,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              letterSpacing: 0.0,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          )),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width * 0.317,
          width: MediaQuery.of(context).size.width * 0.363,
          top: MediaQuery.of(context).size.height * 0.438,
          height: MediaQuery.of(context).size.height * 0.036,
          child: CounterValueHolder(
              child: LayoutBuilder(builder: (context, constraints) {
            return CounterValueText(
              constraints,
              value: '0',
            );
          })),
        ),
      ]),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
