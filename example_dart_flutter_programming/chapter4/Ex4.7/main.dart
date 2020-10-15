import 'package:flutter/material.dart';

void main() => runApp(new WidgetDemo());

class WidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo App',
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('RaisedButton Demo'),
        ),
        body: Center(
          child: RaisedButton(
            onPressed: () {
              /* do something...*/
            },
            child: const Text(
                'RaisedButton',
                style: TextStyle(fontSize: 20)
            ),
            color: Colors.lightBlue,
            textColor: Colors.white,
            elevation: 20.0,
          ),
        ),
      ),
    );
  }
}
