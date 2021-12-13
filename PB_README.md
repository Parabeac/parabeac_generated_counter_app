# How to leverage Parabeac to manage visual development & business logic.

Parabeac is a design to development tool aimed to continuously integrate design changes into the project repo. Parabeac generates UI code from Figma/Sketch to Flutter. Knowing how to handle the UI code generated is crucial to having a successful project integration. There are just a few things to understand which can be laid out below. 

1. Parabeac generates static UI code (.g)
2. Providers wrap UI code (bloc, provider, riverpod)
3. Dynamic UI elements need to be tagged (`<custom>`)

### Parabeac genereates static UI code (.g)
For UI elements that are screens or components, Parabeac generates `*.g.dart` files. These are intended for the designer to own without any developer modification. This might sound scary, but it's actually super useful because it enables the developer to focus on more important things than managing the UI.

### Providers wrap UI code (bloc, provider, riverpod)
As previously mentioned, because we can't touch the static UI code, we can't add state values or logic in those files directly. But we can wrap the static widget in a provider, which enables the children to access the state data. You may be wondering, "why would we do this if the children UI is static and can't be modified by the developer.". This goes hand in hand with the next rule, where we enable some UI elements to be controlled by the developer, thus being able to interact with this state data.

### Dynamic UI elements need to be tagged (`<custom>`)
When a designer tags a component with the `<custom>` naming convention, Parabeac generates a boilerplate dart file that is NOT (.g.dart) for the UI to include developer code. If we traverse up the widget tree, find a provider and reference it, this widget can access that state data.

A good example project based on the Flutter counter app can be found [here](https://github.com/Parabeac/parabeac_generated_counter_app) to show how to follow these rules. We also go in depth through the following examples:

* How to wrap screens and views with state & business logic
* How to reference state & logic on specific widgets
* How to leverage views (Components/Symbols)
* When the UI can't be automatically interpreted & generated

### How to wrap screens and views with state & business logic
The easiest way for us to start is to visit the main.dart file and have one screen created already. Take any generated screen you have and reference it in the main.dart file like the following:
```
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

      home: MyAppScreen(),
    );
  }
```
Then what you want to do is wrap the screen in a provider, in this example we'll use a Bloc provider called FooCubit.

*foo_cubit.dart*
```
class FooCubit extends Cubit<int> {
  FooCubit({
    String initialState = ":(",
  }) : super(initialState);

  void helloWorld() => emit("Hello World!");
}
```
*main.dart*
```
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


      /// Because HelloWorldScreen is a .g file, it is designed to not be edited by developers.
      /// However, to control the app state & connect business logic, we can wrap the screen in a
      /// BlocProvider with our Cubit & leverage <custom> tags to add the logic on UI components.
        home: BlocProvider(
         create: (BuildContext context) => FooCubit(),
         child: HelloWorldScreen(),
       ),
    );
  }
```
Now children of MyAppScreen can all reference `FooCubit`.

### How to reference state & logic on specific widgets
Now that we know that children of MyAppScreen can reference `FooCubit` we can now access it's values. But we need a place to write code, so go back to your design file & add `<custom>` to a UI element and regenerate the code. You will end up with a boilerplate file with a Stateful widget. In here you will see the following as the starting code in the build function:
```
Widget build(BuildContext context) {
    return widget.child;
}
```

We can now reference the values from the `FooCubit` like the following. When we run the project we will see `:(` printed out in the console.
```
Widget build(BuildContext context) {
    var foo = context.read<FooCubit>().state;
    print(foo);
    return widget.child;
  }
```
<!-- 
### How to leverage views (Components/Symbols)
In most design programs, you can describe components as reusable design elements. Parabeac interprets these and creates .g files similar to how Parabeac treats screens. If available, you can even override properties of these views through the constructor parameters. Try the following design file, [Some Screen That should have a scroll view](google.com) clearly this screen should have a scroll view but Parabeac has no way to describe this. We should do two things here, create a frame that wraps all of the reusable items, and make sure that all the cells in them are reusable. In our custom widget, we can now create a scroll view like below:
```
Widget build(BuildContext context) {
    return widget.child;
    return CustomScrollView(
        center: centerKey,
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return widget.child;
              },
              childCount: 1,
            ),
          ),
        ],
      );
  }
```
However, because this scroll view is intended to be dynamic, the static UI code provided in `widget.child` is not valid. We can see the use of `XComponent(TODO)` in the FooScreen. We can also use this, in our custom code. See below:
```
Widget build(BuildContext context) {
    return widget.child;
    return CustomScrollView(
        center: centerKey,
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return FooComponent(label: "Cell ${index}");
              },
              childCount: 5,
            ),
          ),
        ],
      );
  }
``` -->
### When the UI can't be automatically interpreted & generated
There comes a time when what Parabeac generates will just never be remotely close to what needs to be created. Describing an element as `<custom>` solves this by enabling the developer to write whatever they'd like.

![PB Astronaut Meme](https://github.com/parabeac/parabeac_generated_counter_app/blob/main/pb_astronaut_meme.jpg?raw=true)
