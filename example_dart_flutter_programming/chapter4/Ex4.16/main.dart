import 'package:flutter/material.dart';

void main() => runApp(new WidgetDemo());

class WidgetDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WidgetDemoState();
}

class WidgetDemoState extends State<WidgetDemo> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(title: 'Flutter Demo App', home: ShowDatePicker());
  }
}

class ShowDatePicker extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ShowDatePickerState();
}

class ShowDatePickerState extends State<ShowDatePicker> {
  DateTime _selectedDate;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('DatePicker Demo'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('Show DatePicker'),
                onPressed: () {
                  Future<DateTime> selectedDate = showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2999),
                    builder: (BuildContext context, Widget child) {
                      return Theme(
                        data: ThemeData.dark(),
                        child: child,
                      );
                    },
                  );
                  selectedDate.then((date) {
                    setState(() {
                      _selectedDate = date;
                    });
                  });
                },
              ),
              if (_selectedDate != null)
                Text('${_selectedDate.year}-${_selectedDate
                    .month}-${_selectedDate.day}'),
            ],
          )),
    );
  }
}
