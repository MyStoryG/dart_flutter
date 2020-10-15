import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(StateDemo());
}

class Counter extends ChangeNotifier {
  int number = 0;

  void add() {
    number++;
    notifyListeners();
  }
}

class StateDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Counter>(
      create: (_) => Counter(),
      child: MaterialApp(
          title: 'Flutter Demo App',
          initialRoute: '/page1',
          routes: {
            '/page1': (context) => FirstPage(),
            '/page2': (context) => SecondPage(),
          }),
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FirstPageState();
}

class FirstPageState extends State<FirstPage> {
  var counter;

  @override
  Widget build(BuildContext context) {
    counter = Provider.of<Counter>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/page2');
              },
              child: Text('Go to next page'),
            ),
          ),
          Text('${counter.number}'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.add();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  var counter;

  @override
  Widget build(BuildContext context) {
    counter = Provider.of<Counter>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go to previous page'),
            ),
          ),
          Consumer<Counter>(
            builder: (context, counter, child) {
              return Text('${counter.number}');
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.add();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
