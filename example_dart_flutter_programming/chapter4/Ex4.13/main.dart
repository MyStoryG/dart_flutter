import 'package:flutter/material.dart';

void main() => runApp(new _SwitchDemo());

enum Fruit { APPLE, BANANA }

class _SwitchDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<_SwitchDemo> {
  Fruit _fruit = Fruit.APPLE;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo App',
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Radio Demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ListTile(
                title: Text('사과'),
                leading: Radio(
                  value: Fruit.APPLE,
                  groupValue: _fruit,
                  onChanged: (value) {
                    setState(() {
                      _fruit = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text('바나나'),
                leading: Radio(
                  value: Fruit.BANANA,
                  groupValue: _fruit,
                  onChanged: (value) {
                    setState(() {
                      _fruit = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
