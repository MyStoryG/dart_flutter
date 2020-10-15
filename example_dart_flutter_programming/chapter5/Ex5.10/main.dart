import 'package:flutter/material.dart';

void main() => runApp(new WidgetDemo());

class WidgetDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WidgetDemoState();
}

class WidgetDemoState extends State<WidgetDemo> {
  int _curIndex = 0;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo App',
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('BottomNavigationBar Demo'),
        ),
        body: getPage(),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _curIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
                color: _curIndex == 0 ? Colors.blue : Colors.black54,
              ),
              title: Text(
                "Home",
                style: TextStyle(
                    fontSize: 15,
                    color: _curIndex == 0 ? Colors.blue : Colors.black54),
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(
                Icons.search,
                size: 30,
                color: _curIndex == 1 ? Colors.blue : Colors.black54,
              ),
              title: Text(
                "Search",
                style: TextStyle(
                    fontSize: 15,
                    color: _curIndex == 1 ? Colors.blue : Colors.black54),
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(
                Icons.settings,
                size: 30,
                color: _curIndex == 2 ? Colors.blue : Colors.black54,
              ),
              title: Text(
                "Settings",
                style: TextStyle(
                    fontSize: 15,
                    color: _curIndex == 2 ? Colors.blue : Colors.black54),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getPage() {
    Widget page;
    switch (_curIndex) {
      case 0:
        page = page1();
        break;
      case 1:
        page = page2();
        break;
      case 2:
        page = page3();
        break;
    }
    return page;
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

  Container page3() {
    return Container(
      alignment: Alignment.center,
      child: Text(
        'Settings',
        style: TextStyle(color: Colors.blue, fontSize: 30),
      ),
    );
  }
}
