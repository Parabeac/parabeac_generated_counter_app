import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temp/models/counter_cubit.dart';
import 'package:temp/screens/page_1/my_app_screen.g.dart';

void main() {
  runApp(MyApp());
}

/// This is a sample project to show how to work with Parabeac generated code as of Parabeac-Core v2.0
/// We will reference the following Figma file and the generated PARABEAC_README
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),

      /// Because MyAppScreen is a .g file, it is designed to not be edited by developers.
      /// However, to control the app state & connect business logic, we can wrap the screen in a
      /// BlocProvider with our Cubit & leverage <custom> tags to add the logic on UI components.
      home: BlocProvider(
        create: (BuildContext context) => CounterCubit(),
        child: MyAppScreen(),
      ),
    );
  }
}
