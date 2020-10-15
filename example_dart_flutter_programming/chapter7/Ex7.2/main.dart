import 'package:flutter/material.dart';

void main() => runApp(new WidgetDemo());

class WidgetDemo extends StatefulWidget {
  @override
  WidgetDemoState createState() => WidgetDemoState();
}

class WidgetDemoState extends State<WidgetDemo> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo App',
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Container Demo'),
        ),
        body: GestureDetector(
          onTap: () {
            setState(() {
              selected = !selected;
            });
          },
          child: AnimatedContainer(
            child: Text(
              'This is AnimatedContainer Example.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
            padding: EdgeInsets.all(80.0),
            margin: EdgeInsets.all(50.0),
            color: Colors.blue,
            width: selected ? 250.0 : 310.0,
            height: selected ? 250.0 : 310.0,
            duration: Duration(milliseconds: 500),
          ),
        ),
      ),
    );
  }
}
