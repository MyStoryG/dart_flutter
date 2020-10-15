import 'package:flutter/material.dart';

void main() => runApp(new WidgetDemo());

class WidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo App',
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('OutlineButton Demo'),
        ),
        body: Center(
          child: OutlineButton(
            onPressed: () {
              /* do something...*/
            },
            child: Text(
              'OutlineButton Button',
              style: TextStyle(fontSize: 20.0),
            ),
            borderSide: BorderSide(
              color: Colors.lightBlue,
              width: 2.0,
              style: BorderStyle.solid,
            ),
            textColor: Colors.black,
          ),
        ),
      ),
    );
  }
}
