import 'package:flutter/material.dart';

void main() => runApp(new WidgetDemo());

class WidgetDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WidgetDemoState();
}

class WidgetDemoState extends State<WidgetDemo> {
  String dropdownValue = 'Apple';

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo App',
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('FloatingActionButton Demo'),
        ),
        body: Center(
          child: const Text('Press the button to add a photo.'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // do something
          },
          child: Icon(Icons.add_a_photo),
          backgroundColor: Colors.blue,
        ),
      ),
    );
  }
}
