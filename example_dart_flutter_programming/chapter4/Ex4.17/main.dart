import 'package:flutter/material.dart';

void main() => runApp(new WidgetDemo());

class WidgetDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WidgetDemoState();
}

class WidgetDemoState extends State<WidgetDemo> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(title: 'Flutter Demo App', home: ShowTimePicker());
  }
}

class ShowTimePicker extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ShowTimePickerState();
}

class ShowTimePickerState extends State<ShowTimePicker> {
  TimeOfDay _selectedTime;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('TimePicker Demo'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('Show TimePicker'),
                onPressed: () {
                  Future<TimeOfDay> selectedTime = showTimePicker(
                    initialTime: TimeOfDay.now(),
                    context: context,
                  );
                  selectedTime.then((date) {
                    setState(() {
                      _selectedTime = date;
                    });
                  });
                },
              ),
              if (_selectedTime != null)
                Text('${_selectedTime.hour}:${_selectedTime.minute}'),
            ],
          )),
    );
  }
}
