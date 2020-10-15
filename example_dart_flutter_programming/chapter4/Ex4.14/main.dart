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
          title: const Text('SimpleDialog Demo'),
        ),
        body: Center(
          child: SimpleDialog(
            title: Text("SimpleDialog Title"),
            children: [
              Text("This is SimpleDialog."),
            ],
          ),
        ),
      ),
    );
  }
}
