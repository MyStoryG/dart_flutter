import 'package:flutter/material.dart';

void main() => runApp(new WidgetDemo());

class WidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo App',
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('TextField Demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('You can input text.'),
              TextField(),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Input Name',
                  helperText: 'Korean language support',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
