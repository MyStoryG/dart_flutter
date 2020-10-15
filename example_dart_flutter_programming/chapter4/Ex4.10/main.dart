import 'package:flutter/material.dart';

enum RGB { red, green, blue }

void main() => runApp(new WidgetDemo());

class WidgetDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WidgetDemoState();
}

class WidgetDemoState extends State<WidgetDemo> {
  RGB _selection = RGB.red;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo App',
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('PopupMenuButton Demo'),
        ),
        body: Center(
          child: PopupMenuButton<RGB>(
            onSelected: (RGB result) {
              setState(() {
                _selection = result;
              });
            },
            itemBuilder: (BuildContext context) =>
            <PopupMenuEntry<RGB>>[
              const PopupMenuItem<RGB>(
                value: RGB.red,
                child: Text('Red'),
              ),
              const PopupMenuItem<RGB>(
                value: RGB.green,
                child: Text('Green'),
              ),
              const PopupMenuItem<RGB>(
                value: RGB.blue,
                child: Text('Blue'),
              ),
            ],
          ),
        ),
      ),);
  }
}
