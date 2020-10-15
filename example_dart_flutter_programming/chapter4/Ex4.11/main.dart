import 'package:flutter/material.dart';

void main() => runApp(new WidgetDemo());

class WidgetDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WidgetDemoState();
}

class WidgetDemoState extends State<WidgetDemo> {
  int _number = 0;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo App',
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('IconButton Demo'),
        ),
        body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.add_box),
                  iconSize: 30.0,
                  color: Colors.lightBlue,
                  tooltip: 'Add 1',
                  onPressed: () {
                    setState(() {
                      _number += 1;
                    });
                  },
                ),
                Text('Number : $_number')
              ],
            )),
      ),
    );
  }
}
