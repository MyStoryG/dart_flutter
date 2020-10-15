import 'package:flutter/material.dart';

void main() => runApp(new WidgetDemo());

class WidgetDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WidgetDemoState();
}

class WidgetDemoState extends State<WidgetDemo> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo App',
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('AlertDialog Demo'),
        ),
        body: Center(
          child: AlertDialog(
            title: Text('AlertDialog Title'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('This is AlertDialog.'),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  // do something
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
