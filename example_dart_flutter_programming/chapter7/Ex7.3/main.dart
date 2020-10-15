import 'package:flutter/material.dart';

void main() => runApp(new WidgetDemo());

class WidgetDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WidgetDemoState();
}

class WidgetDemoState extends State<WidgetDemo> {
  double sizeValue = 100.0;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo App',
      home: new Scaffold(
          appBar: new AppBar(
            title: const Text('TweenAnimationBuilder Demo'),
          ),
          body: Center(
            child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: sizeValue),
              duration: Duration(seconds: 1),
              builder: (BuildContext context, double size, Widget childWidget) {
                return IconButton(
                  iconSize: size,
                  color: Colors.blue,
                  icon: childWidget,
                  onPressed: () {
                    setState(() {
                      sizeValue = sizeValue == 100.0 ? 200.0 : 100.0;
                    });
                  },
                );
              },
              child: Icon(Icons.sentiment_satisfied),
            ),
          )),
    );
  }
}
