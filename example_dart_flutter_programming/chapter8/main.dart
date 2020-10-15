import 'package:flutter/material.dart';
import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'dart:isolate';
import 'dart:ui';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:foreground_service/foreground_service.dart';
import 'package:android_intent/android_intent.dart';
import 'package:android_intent/flag.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:weather/weather.dart';

void main() {
  runApp(Phoenix(
    child: new AlarmWeather(),
  ));
}

void startService(DateTime dateTime) async {
  if (!(await ForegroundService.foregroundServiceIsStarted())) {
    await ForegroundService.setServiceIntervalSeconds(10);

    await ForegroundService.notification.startEditMode();
    await ForegroundService.notification.setTitle("등록된 알람");
    await ForegroundService.notification.setText("$dateTime");
    await ForegroundService.notification.finishEditMode();

    await ForegroundService.startForegroundService(foregroundServiceFunction);
    await ForegroundService.getWakeLock();
  }

  await ForegroundService.setupIsolateCommunication((data) {
    debugPrint("main received: $data");
  });
}

void foregroundServiceFunction() {
  debugPrint("The current time is: ${DateTime.now()}");

  if (!ForegroundService.isIsolateCommunicationSetup) {
    ForegroundService.setupIsolateCommunication((data) {
      debugPrint("bg isolate received: $data");
    });
  }

  ForegroundService.sendToPort("message from bg isolate");
}

class AlarmWeather extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AlarmWeatherState();
}

class AlarmWeatherState extends State<AlarmWeather> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(title: 'Flutter Project', home: MainPage(), routes: {
      '/page1': (context) => MainPage(),
      '/page2': (context) => SecondPage(),
    });
  }
}

Future<bool> removeAlarmInfo(int id, BuildContext context) async {
  print('removeAlarmInfo()');
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int count = await getAlarmCount();
  int i = 0;
  for (i = id; i < count; i++) {
    var myFuture = await getAlarmInfo(i);
    var myNextFuture = await getAlarmInfo(i + 1);
    var alarmID = await getAlarmID(myNextFuture[0]);

    await saveAlarmInfo(
        myFuture[0], myNextFuture[1], myNextFuture[2].format(context), myNextFuture[3]);

    await saveAlarmID(myFuture[0], alarmID);

    if (myNextFuture[0] == 100) {
      break;
    }
  }
  prefs.remove(i.toString());
  removeAlarmID(i);

  checkStopService();
  return true;
}

void removeAlarmID(int listID) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('alarm_id_' + listID.toString());
}

Future<bool> saveAlarmID(int listID, int alarmID) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return await prefs.setInt('alarm_id_' + listID.toString(), alarmID);
}

Future<int> getAlarmID(int listID) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getInt('alarm_id_' + listID.toString()) ?? 100;
}

void saveAlarmCount(int count) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setInt('count', count);
}

Future<int> getAlarmCount() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getInt('count') ?? 0;
}

Future<bool> saveAlarmInfo(
    int listID, DateTime date, String time, bool on) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  String dateStr = DateFormat('yyyy-MM-dd H:mm:ss').format(date);

  List<String> alarmInfoList = List();
  alarmInfoList.add(listID.toString());
  alarmInfoList.add(dateStr);
  alarmInfoList.add(time);
  alarmInfoList.add(on.toString());

  return await prefs.setStringList(listID.toString(), alarmInfoList);
}

Future<List<dynamic>> getAlarmInfo(int id) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  List<String> defaultData = List();
  String defaultDate = DateFormat('yyyy-MM-dd H:mm:ss').format(DateTime.now());
  String defaultTime = '00:00';

  defaultData.add('100');
  defaultData.add(defaultDate);
  defaultData.add(defaultTime);
  defaultData.add('default');

  List<String> loadData = prefs.getStringList(id.toString()) ?? defaultData;
  List<dynamic> parseData = [100, 200, DateTime.now(), TimeOfDay.now(), false];

  parseData[0] = int.parse(loadData[0]); // listID
  parseData[1] = DateFormat('yyyy-MM-dd H:mm:ss')
      .parse(loadData[1] ?? defaultDate); // DateTime
  parseData[2] = TimeOfDay(
      hour: int.parse(loadData[2].split(":")[0] ?? defaultTime.split(":")[0]),
      minute: int.parse(
          loadData[2].split(":")[1] ?? defaultTime.split(":")[1])); // TimeOfDay

  if ((loadData[3] ?? 'false') == 'true') {
    parseData[3] = true;
  } else {
    parseData[3] = false;
  }

  return parseData;
}

class AlarmInfo {
  DateTime _alarmDate;
  TimeOfDay _alarmTime;
  bool _isAlarmOn;

  AlarmInfo(DateTime date, TimeOfDay time, bool on) {
    this._alarmDate = date;
    this._alarmTime = time;
    this._isAlarmOn = on;
  }

  setAlarmDate(DateTime date) {
    _alarmDate = date;
  }

  getAlarmDate() {
    return _alarmDate;
  }

  setAlarmTime(TimeOfDay time) {
    _alarmTime = time;
  }

  getAlarmTime() {
    return _alarmTime;
  }

  setAlarmOn(bool on) {
    _isAlarmOn = on;
  }

  isAlarmOn() {
    return _isAlarmOn;
  }
}

Future<bool> showAlertDialog(
        BuildContext context, List<AlarmInfo> alarmInfo, int index) async =>
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('알람'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('알람을 삭제합니다.'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () async {
                await removeAlarmInfo(index, context);
                AndroidAlarmManager.cancel(index);
                stopAlarm();
                Navigator.pop(context);
                return true;
              },
            ),
          ],
        );
      },
    );

class AlarmTile extends StatefulWidget {
  final List<AlarmInfo> _alarmInfo;
  final int _index;

  AlarmTile(this._alarmInfo, this._index);

  @override
  State<StatefulWidget> createState() => AlarmTileState();
}

class AlarmTileState extends State<AlarmTile> {
  bool _isChecked;

  @override
  Widget build(BuildContext context) {
    if (widget._alarmInfo.isEmpty) {
      return ListTile(
        title: Text('등록된 알람이 없습니다.'),
        subtitle: Text('알람을 등록해주세요.'),
      );
    }
    _isChecked = widget._alarmInfo[widget._index].isAlarmOn();
    final f = new DateFormat('yyyy-MM-dd H:mm');
    int counterForAlarmOn = 0;
    return ListTile(
      leading: Icon(
        Icons.alarm,
        size: 40,
      ),
      title:
          Text('${f.format(widget._alarmInfo[widget._index].getAlarmDate())}'),
      subtitle: Text('알람'),
      trailing: Switch(
        value: _isChecked,
        onChanged: (value) async {
          setState(() {
            _isChecked = value;
          });

          widget._alarmInfo[widget._index]
              .setAlarmOn(!widget._alarmInfo[widget._index].isAlarmOn());
          var alarmID = await getAlarmID(widget._index);
          if (widget._alarmInfo[widget._index].isAlarmOn()) {
            AndroidAlarmManager.oneShotAt(
              widget._alarmInfo[widget._index].getAlarmDate(),
              alarmID,
              startAlarm,
              exact: true,
            );
          } else {
            AndroidAlarmManager.cancel(alarmID);
            stopAlarm();
          }

          for (int i = 0; i < widget._alarmInfo.length; i++) {
            if (widget._alarmInfo[i].isAlarmOn() == true) {
              counterForAlarmOn++;
            }
          }
          if (counterForAlarmOn == 0) {
            ForegroundService.stopForegroundService();
          } else {
            startService(widget._alarmInfo[widget._index].getAlarmDate());
            counterForAlarmOn = 0;
          }
          saveAlarmInfo(
              widget._index,
              widget._alarmInfo[widget._index].getAlarmDate(),
              (widget._alarmInfo[widget._index].getAlarmTime()).format(context),
              widget._alarmInfo[widget._index].isAlarmOn());
        },
      ),
      onLongPress: () async {
        await showAlertDialog(context, widget._alarmInfo, widget._index);
        Phoenix.rebirth(context);
      },
    );
  }
}

void checkStopService() async {
  print('checkStopService()');
  int counterForAlarmOn = 0;
  var count = await getAlarmCount();
  for (int i = 0; i < count; i++) {
    var myFuture = await getAlarmInfo(i);
    if (myFuture[3]) {
      counterForAlarmOn++;
    }
  }

  if (counterForAlarmOn == 0) {
    ForegroundService.stopForegroundService();
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool _isAlarmOn = false;
  int _alarmID = 0;
  DateTime _date = DateTime.now();
  TimeOfDay _time = TimeOfDay.now();
  int _curPageIndex = 0;
  int _listIndex = 0;
  final List<AlarmInfo> alarmList = <AlarmInfo>[];
  String _weatherStr;

  Future<Null> getInitData() async {
    var count = await getAlarmCount();
    for (int i = 0; i < count; i++) {
      var value = await getAlarmInfo(i);
      if (!(value[0] == 100)) {
        var alarmID = await getAlarmID(value[0]);
        setState(() {
          alarmList.insert(_listIndex, AlarmInfo(value[1], value[2], value[3]));
          saveAlarmInfo(
              _listIndex, value[1], value[2].format(context), value[3]);
          saveAlarmID(_listIndex, alarmID);
          _listIndex++;
          saveAlarmCount(_listIndex);
        });
      }
    }
  }

  @override
  void initState() {
    print('initState()');
    super.initState();
    getInitData();
  }

  void addItemToList() {
    setState(() {
      _isAlarmOn = true;
      saveAlarmInfo(_listIndex, _date, _time.format(context), _isAlarmOn);
      alarmList.insert(_listIndex, AlarmInfo(_date, _time, _isAlarmOn));
      _listIndex++;
      saveAlarmCount(_listIndex);
    });
  }

  Future<DateTime> selectDate(BuildContext context) {
    return showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2999));
  }

  Future<TimeOfDay> selectTime(BuildContext context) {
    return showTimePicker(context: context, initialTime: TimeOfDay.now());
  }

  @override
  Widget build(BuildContext context) {
    setRebirth(context);
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Alarm and Weather'),
      ),
      body: getPage(),
      floatingActionButton: getButton(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _curPageIndex = index;
          });
          if (index == 1) {
            getWeather();
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.alarm,
              size: 30,
              color: _curPageIndex == 0 ? Colors.blue : Colors.black54,
            ),
            title: Text(
              "Alarm",
              style: TextStyle(
                  fontSize: 15,
                  color: _curPageIndex == 0 ? Colors.blue : Colors.black54),
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(
              Icons.wb_sunny,
              size: 30,
              color: _curPageIndex == 1 ? Colors.blue : Colors.black54,
            ),
            title: Text(
              "Weather",
              style: TextStyle(
                  fontSize: 15,
                  color: _curPageIndex == 1 ? Colors.blue : Colors.black54),
            ),
          )
        ],
      ),
    );
  }

  Widget getPage() {
    Widget page;
    switch (_curPageIndex) {
      case 0:
        page = alarmPage();
        break;
      case 1:
        page = weatherPage();
        break;
    }
    return page;
  }

  FloatingActionButton getButton() {
    FloatingActionButton button;
    switch (_curPageIndex) {
      case 0:
        button = alarmAddButton();
        break;
      case 1:
        button = null;
        break;
    }
    return button;
  }

  Center weatherPage() {
    if (_weatherStr != null) {
      if (_weatherStr.contains('Clear')) {
        return Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Text(
                '서울',
                style: TextStyle(fontSize: 30.0),
              ),
              Icon(
                Icons.wb_sunny,
                color: Colors.blue,
                size: 150.0,
              ),
              Text(
                '맑음',
                style: TextStyle(fontSize: 30.0),
              ),
            ]));
      } else if (_weatherStr.contains('Clouds')) {
        return Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Text(
                '서울',
                style: TextStyle(fontSize: 30.0),
              ),
              Icon(
                Icons.cloud,
                color: Colors.blue,
                size: 150.0,
              ),
              Text(
                '흐림',
                style: TextStyle(fontSize: 30.0),
              ),
            ]));
      } else if (_weatherStr.contains('Rain')) {
        return Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Text(
                '서울',
                style: TextStyle(fontSize: 30.0),
              ),
              Icon(
                Icons.grain,
                color: Colors.blue,
                size: 150.0,
              ),
              Text(
                '비',
                style: TextStyle(fontSize: 30.0),
              ),
            ]));
      } else {
        return Center(
          child: Text('Can\'t find weather information'),
        );
      }
    } else {
      return Center(
        child: Text('Loading...'),
      );
    }
  }

  ListView alarmPage() {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: alarmList.length,
        itemBuilder: (BuildContext context, int index) {
          if (alarmList.isEmpty) {
            return Text('Alarm is empty!');
          }
          return AlarmTile(alarmList, index);
        });
  }

  FloatingActionButton alarmAddButton() {
    return FloatingActionButton(
      tooltip: 'Add Alarm',
      child: Icon(Icons.alarm_add),
      onPressed: () {
        selectDate(context).then((value) {
          _date = value;
          if (_date != null) {
            selectTime(context).then((value) {
              _time = value;
              if (_time != null) {
                _date = DateTime(_date.year, _date.month, _date.day, _time.hour,
                    _time.minute);
                setAlarmManager();
                addItemToList();
              } else {
                _time = TimeOfDay.now();
              }
            });
          } else {
            _date = DateTime.now();
          }
        });
      },
    );
  }

  Future<Weather> getWeather() async {
    String key = '856822fd8e22db5e1ba48c0e7d69844a';
    String cityName = 'Seoul';
    WeatherFactory wf = WeatherFactory(key);
    Weather weather = await wf.currentWeatherByCityName(cityName);
    setState(() {
      _weatherStr = weather.toString();
    });
    return weather;
  }

  void setAlarmManager() async {
    await AndroidAlarmManager.initialize();
    await AndroidAlarmManager.oneShotAt(
      _date,
      _alarmID,
      startAlarm,
      exact: true,
    );
    await saveAlarmID(_listIndex - 1, _alarmID);
    _alarmID++;
    startService(_date);
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alarm Off"),
      ),
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(150.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue,
        ),
        child: IconButton(
          icon: Icon(Icons.alarm_off),
          iconSize: 50.0,
          color: Colors.white,
          tooltip: 'Alarm Off',
          onPressed: () async {
            List<String> dateList = List();
            var count = await getAlarmCount();
            for (int i = 0; i < count; i++) {
              var myFuture = await getAlarmInfo(i);
              if (myFuture[3]) {
                String date =
                    DateFormat('yyyy-MM-dd H:mm:ss').format(myFuture[1]) +
                        ' ' +
                        myFuture[2].format(context);
                dateList.add(date);
              }
            }

            dateList.sort((a, b) => a.compareTo(b));

            int counterForAlarmOn = 0;
            for (int i = 0; i < count; i++) {
              var myFuture = await getAlarmInfo(i);
              if (myFuture[3]) {
                counterForAlarmOn++;
              }
            }

            if (dateList.isNotEmpty) {
              for (int i = 0; i < count; i++) {
                var myFuture = await getAlarmInfo(i);
                String date =
                    DateFormat('yyyy-MM-dd H:mm:ss').format(myFuture[1]) +
                        ' ' +
                        myFuture[2].format(context);
                if (dateList[0] == date) {
                  await removeAlarmInfo(i, context);
                  counterForAlarmOn--;
                  if (counterForAlarmOn == 0) {
                    ForegroundService.stopForegroundService();
                  } else {
                    counterForAlarmOn = 0;
                  }
                  stopAlarm();
                  SystemNavigator.pop();
                  break;
                }
              }
            }
          },
        ),
      ),
    );
  }
}

void stopAlarm() {
  print('stopAlarm()');
  SendPort sendPort = IsolateNameServer.lookupPortByName('player');
  if (sendPort != null) {
    sendPort.send('stop');
  }
}

void setRebirth(BuildContext context) {
  print('setRebirth()');

  ReceivePort receivePort = new ReceivePort();
  IsolateNameServer.removePortNameMapping('rebirth');
  IsolateNameServer.registerPortWithName(receivePort.sendPort, 'rebirth');
  receivePort.listen((message) {
    if (message == 'start') {
      print('rebirth received $message');
      AndroidIntent intent = AndroidIntent(
          package: 'com.project.alarm_weather',
          componentName: 'com.project.alarm_weather.MainActivity',
          flags: <int>[
            Flag.FLAG_ACTIVITY_CLEAR_TOP,
            Flag.FLAG_ACTIVITY_SINGLE_TOP
          ]);
      intent.launch();
      Navigator.pushReplacementNamed(context, '/page2');
      receivePort.close();
      IsolateNameServer.removePortNameMapping('rebirth');
    }
  });
}

void startAlarm() async {
  print('startAlarm()');
  AudioCache player = AudioCache();
  AudioPlayer audioPlayer = await player.loop('good_morning.mp3');

  ReceivePort receivePort = new ReceivePort();
  IsolateNameServer.registerPortWithName(receivePort.sendPort, 'player');
  receivePort.listen((message) {
    if (audioPlayer == null) {
      print('audioPlayer is null!');
    } else {
      audioPlayer.stop();
    }
    receivePort.close();
    IsolateNameServer.removePortNameMapping('player');
    print('player received $message');
  });

  SendPort sendPort = IsolateNameServer.lookupPortByName('rebirth');
  sendPort.send('start');
}
