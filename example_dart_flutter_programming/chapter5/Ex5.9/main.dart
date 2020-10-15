import 'package:flutter/material.dart';

void main() => runApp(new WidgetDemo());

class WidgetDemo extends StatelessWidget {
  final controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo App',
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('PageView Demo'),
        ),
        body: PageView(
          controller: controller,
          children: <Widget>[
            page1(),
            page2(),
          ],
        ),
      ),
    );
  }

  ListView page1() {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text('ListView'),
          subtitle: Text('Using ListTile'),
          trailing: Icon(Icons.more_vert),
          onTap: () {},
        ),
        ListTile(
          leading: FlutterLogo(
            size: 50.0,
          ),
          title: Text('Flutter'),
          trailing: Icon(Icons.autorenew),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(
            Icons.account_box,
            size: 50.0,
          ),
          title: Text('Contacts'),
          subtitle: Text('Add Phone Number'),
          trailing: Icon(Icons.add),
          onTap: () {},
        ),
      ],
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
