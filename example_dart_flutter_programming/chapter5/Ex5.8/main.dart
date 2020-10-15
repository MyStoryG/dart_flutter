import 'package:flutter/material.dart';

void main() => runApp(new WidgetDemo());

class WidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo App',
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('GridView Demo'),
        ),
        body: page2(),
      ),
    );
  }

  GridView page2() {
    return GridView.count(
      padding: const EdgeInsets.all(10),
      crossAxisSpacing: 10,
      mainAxisSpacing: 50,
      crossAxisCount: 3,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: const Text("1"),
          color: Colors.blue[100],
        ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: const Text('2'),
          color: Colors.blue[200],
        ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: const Text('3'),
          color: Colors.blue[300],
        ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: const Text('4'),
          color: Colors.blue[400],
        ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: const Text('5'),
          color: Colors.blue[500],
        ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: const Text('6'),
          color: Colors.blue[600],
        ),
      ],
    );
  }
}
