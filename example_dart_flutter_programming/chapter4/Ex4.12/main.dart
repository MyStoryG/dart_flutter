import 'package:flutter/material.dart';

void main() => runApp(new _CheckboxDemo());

class _CheckboxDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CheckboxDemoState();

}

class _CheckboxDemoState extends State<_CheckboxDemo> {
  var _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo App',
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Checkbox Demo'),
        ),
        body: Center(
            child: Checkbox(
              value: _isChecked,
              onChanged: (value) {
                setState(() {
                  _isChecked = value;
                });
              },
            )
        ),
      ),
    );
  }
}
