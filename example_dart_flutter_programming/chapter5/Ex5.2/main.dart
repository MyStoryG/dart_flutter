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
        body: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                '1,',
                style: TextStyle(fontSize: 30.0),
              ),
              Text(
                '2,',
                style: TextStyle(fontSize: 30.0),
              ),
              Text(
                '3',
                style: TextStyle(fontSize: 30.0),
              ),
            ]),
      ),
    );
  }
}
