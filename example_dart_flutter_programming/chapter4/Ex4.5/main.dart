import 'package:flutter/material.dart';

void main() => runApp(new WidgetDemo());

class WidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo App',
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('FlatButton Demo'),
        ),
        body: Center(
          child: FlatButton(
            onPressed: () {
              /*do something...*/
            },
            child: Text(
              'Flat Button',
              style: TextStyle(fontSize: 20.0),
            ),
            color: Colors.lightBlue,
            textColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
