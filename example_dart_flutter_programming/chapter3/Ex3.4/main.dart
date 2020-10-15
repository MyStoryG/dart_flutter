import 'package:flutter/material.dart';

void main() => runApp(TestApp());

class TestApp extends StatelessWidget {
  TestApp() {
    print('TestApp()');
  }

  @override
  Widget build(BuildContext context) {
    print('build 0');
    return MaterialApp(
      title: 'StatefulWidget Lifecycle App',
      home: _FirstStatefulWidget(),
    );
  }
}

class _FirstStatefulWidget extends StatefulWidget {
  _FirstStatefulWidget() {
    print('_FirstStatefulWidget()');
  }

  @override
  State<StatefulWidget> createState() => _FirstStatefulWidgetState();
}

class _FirstStatefulWidgetState extends State<_FirstStatefulWidget> {
  int _counter;

  _FirstStatefulWidgetState() {
    print('_FirstStatefulWidgetState() ${this.mounted}');
  }

  @override
  Widget build(BuildContext context) {
    print('build() 1 ${this.mounted}');
    return Scaffold(
      appBar: AppBar(title: Text('(1) StatefulWidget Lifecycle')),
      body: Column(
        children: <Widget>[
          RaisedButton(
              child: Text('Go Next'),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return _SecondStatefulWidget();
                }));
              }),
          RaisedButton(
              child: Text('Counter'),
              onPressed: () {
                _onClick();
              }),
          Row(
            children: <Widget>[
              Text('$_counter'),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    print('initState() 1');
    super.initState();
    _counter = 0;
  }

  @override
  void reassemble() {
    print('reassemble() 1');
    super.reassemble();
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies() 1');
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    print('dispose() 1');
    super.dispose();
  }

  @override
  void deactivate() {
    print('deactivate() 1');
    super.deactivate();
  }

  @override
  void didUpdateWidget(_FirstStatefulWidget oldWidget) {
    print('didUpdateWidget() 1');
    super.didUpdateWidget(oldWidget);
  }

  void _onClick() {
    print('onClick() 1');
    if (this.mounted) {
      setState(() {
        print('setState() 1');
        _counter++;
      });
    }
  }
}

class _SecondStatefulWidget extends StatefulWidget {
  _SecondStatefulWidget() {
    print('_SecondStatefulWidget()');
  }

  @override
  State<StatefulWidget> createState() => _SecondStatefulWidgetState();
}

class _SecondStatefulWidgetState extends State<_SecondStatefulWidget> {
  int _counter;

  _SecondStatefulWidgetState() {
    print('_SecondStatefulWidgetState() ${this.mounted}');
  }

  @override
  Widget build(BuildContext context) {
    print('build() 2 ${this.mounted}');
    return Scaffold(
      appBar: AppBar(title: Text('(2) StatefulWidget Lifecycle')),
      body: Column(
        children: <Widget>[
          RaisedButton(
              child: Text('Go Back'),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          RaisedButton(
              child: Text('Counter'),
              onPressed: () {
                _onClick();
              }),
          Row(
            children: <Widget>[
              Text('$_counter'),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    print('initState() 2');
    super.initState();
    _counter = 0;
  }

  @override
  void reassemble() {
    print('reassemble() 2');
    super.reassemble();
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies() 2');
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    print('dispose() 2');
    super.dispose();
  }

  @override
  void deactivate() {
    print('deactivate() 2');
    super.deactivate();
  }

  @override
  void didUpdateWidget(_SecondStatefulWidget oldWidget) {
    print('didUpdateWidget() 2');
    super.didUpdateWidget(oldWidget);
  }

  void _onClick() {
    print('onClick() 2');
    if (this.mounted) {
      setState(() {
        print('setState() 2');
        _counter++;
      });
    }
  }
}
