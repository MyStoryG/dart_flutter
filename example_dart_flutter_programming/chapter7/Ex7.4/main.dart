import 'package:flutter/material.dart';

void main() => runApp(new WidgetDemo());

class WidgetDemo extends StatefulWidget {
  @override
  WidgetDemoState createState() => WidgetDemoState();
}

class WidgetDemoState extends State<WidgetDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo App',
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('RotationTransition Demo'),
        ),
        body: RotationTransition(
          alignment: Alignment.center,
          child: Center(
            child: IconButton(
              iconSize: 200.0,
              color: Colors.blue,
              icon: Icon(Icons.sentiment_satisfied),
              onPressed: () {
                if (_controller.duration.inSeconds == 1) {
                  _controller.duration = const Duration(seconds: 3);
                } else {
                  _controller.duration = const Duration(seconds: 1);
                }
                _controller.repeat();
              },
            ),
          ),
          turns: _controller,
        ),
      ),
    );
  }
}
