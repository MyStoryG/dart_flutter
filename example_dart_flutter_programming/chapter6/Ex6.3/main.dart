import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(StateDemo());

class StateDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<String>.value(
      value: 'Shared Data',
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
  var data;

  @override
  Widget build(BuildContext context) {
    data = Provider.of<String>(context);
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
            Text('$data'),
          ],
        ));
  }
}

class SecondPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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
            Consumer<String>(
              builder: (context, value, child) {
                return Text('$value');
              },
            ),
          ],
        ));
  }
}
