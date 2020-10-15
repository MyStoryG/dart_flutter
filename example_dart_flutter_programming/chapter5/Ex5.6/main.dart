import 'package:flutter/material.dart';

void main() => runApp(new WidgetDemo());

class WidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo App',
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('ListView Demo'),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 500,
              color: Colors.red,
              child: const Center(child: Text('RED')),
            ),
            Container(
              height: 500,
              color: Colors.blue,
              child: const Center(child: Text('BLUE')),
            ),
          ],
        ),
      ),
    );
  }
}
