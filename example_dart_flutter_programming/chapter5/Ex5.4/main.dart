import 'package:flutter/material.dart';

void main() => runApp(new WidgetDemo());

class WidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo App',
      home: new Scaffold(
          appBar: new AppBar(
            title: const Text('Container Demo'),
          ),
          body: Container(
            child: Text(
              'This is Container Example.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            padding: EdgeInsets.all(80.0),
            margin: EdgeInsets.all(50.0),
          )
      ),
    );
  }
}
