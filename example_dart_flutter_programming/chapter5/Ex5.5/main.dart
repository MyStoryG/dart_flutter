import 'package:flutter/material.dart';

void main() => runApp(new WidgetDemo());

class WidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo App',
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('ScrollView Demo'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.red,
                height: 500.0,
                alignment: Alignment.center,
                child: const Text('RED'),
              ),
              Container(
                color: Colors.blue,
                height: 500.0,
                alignment: Alignment.center,
                child: const Text('BLUE'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
