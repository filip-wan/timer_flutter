import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import '../components/getButtonRow.dart';

class TimerPage extends StatefulWidget {
  TimerPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  Stopwatch _stopwatch;
  String _now = "0 : 0 : 0";
  int _setTime = 0;

  @override
  void initState() {
    this._stopwatch = new Stopwatch();
    Timer.periodic(Duration(milliseconds: 33), _timerCallback);
    super.initState();
  }

  void _startButton() {
    setState(() {
      if (this._stopwatch.isRunning) {
        this._stopwatch.stop();
        this._setTime = this._setTime - this._stopwatch.elapsedMilliseconds;
        this._setTime = this._setTime < 0 ? 0 : this._setTime;
        this._now = this._getTime(this._setTime);
        this._stopwatch.reset();
      } else
        this._stopwatch.start();
    });
  }

  void _modifyTimeButton(int seconds) {
    setState(() {
      int time = this._setTime - this._stopwatch.elapsedMilliseconds;
      this._setTime = (time < 0 ? 0 : time) + (seconds * 1000);
      this._now = this._getTime(this._setTime);
      this._stopwatch.reset();
    });
  }

  String _getTime(int milliseconds) {
    int seconds = (milliseconds / 1000).floor();
    int minutes = (seconds / 60).floor();
    int hours = (minutes / 60).floor();

    return '${(hours % 24).toString()} : ${(minutes % 60).toString()} : ${(seconds % 60).toString()}';
  }

  void _timerCallback(Timer t) {
    if (this._stopwatch.isRunning) {
      int elapsedTime = this._setTime - this._stopwatch.elapsedMilliseconds;
      setState(() {
        if (elapsedTime > 0)
          this._now = this._getTime(elapsedTime);
        else {
          this._now = "Time Is Up!";
          HapticFeedback.vibrate();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              '${this._now}',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          getButtonRow([
            FlatButton(
              child: Text(
                this._stopwatch.isRunning ? "Stop" : "Start",
              ),
              color: Theme.of(context).buttonColor,
              onPressed: () => this._startButton(),
            ),
          ]),
          getButtonRow([
            FlatButton(
              child: Text("-1s"),
              color: Theme.of(context).buttonColor,
              onPressed: () => this._modifyTimeButton(-1),
            ),
            FlatButton(
              child: Text("+1s"),
              color: Theme.of(context).buttonColor,
              onPressed: () => this._modifyTimeButton(1),
            ),
          ]),
          getButtonRow([
            FlatButton(
              child: Text("-10s"),
              color: Theme.of(context).buttonColor,
              onPressed: () => this._modifyTimeButton(-10),
            ),
            FlatButton(
              child: Text("+10s"),
              color: Theme.of(context).buttonColor,
              onPressed: () => this._modifyTimeButton(10),
            ),
          ]),
          getButtonRow([
            FlatButton(
              child: Text("-1min"),
              color: Theme.of(context).buttonColor,
              onPressed: () => this._modifyTimeButton(-60),
            ),
            FlatButton(
              child: Text("+1min"),
              color: Theme.of(context).buttonColor,
              onPressed: () => this._modifyTimeButton(60),
            ),
          ]),
          getButtonRow([
            FlatButton(
              child: Text("-10min"),
              color: Theme.of(context).buttonColor,
              onPressed: () => this._modifyTimeButton(-600),
            ),
            FlatButton(
              child: Text("+10min"),
              color: Theme.of(context).buttonColor,
              onPressed: () => this._modifyTimeButton(600),
            ),
          ]),
        ],
      ),
    );
  }
}
