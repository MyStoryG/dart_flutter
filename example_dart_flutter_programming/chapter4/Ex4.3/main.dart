import 'package:flutter/material.dart';

void main() => runApp(new WidgetDemo());

class WidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo App',
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Icon Demo'),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const <Widget>[
            Icon(
              Icons.favorite,
              color: Colors.pink,
              size: 30.0,
            ),
            Icon(
              Icons.access_alarm,
              color: Colors.blue,
              size: 30.0,
            ),
          ],
        ),
      ),
    );
  }
}
