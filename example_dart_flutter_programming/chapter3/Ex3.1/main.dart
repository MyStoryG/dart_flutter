import 'package:flutter/material.dart';

void main() => runApp(new HelloWorld());

class HelloWorld extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'First Flutter App',
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Hello World Demo'),
        ),
        body: const Center(
          child: const Text('Hello World'),
        ),
      ),
    );
  }
}
