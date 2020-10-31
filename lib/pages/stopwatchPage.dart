import 'package:flutter/material.dart';
import 'dart:async';
import '../components/getButtonRow.dart';

class StopwatchPage extends StatefulWidget {
  StopwatchPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _StopwatchPageState createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  Stopwatch _stopwatch;
  String _now = "0 s";

  @override
  void initState() {
    this._stopwatch = new Stopwatch();
    Timer.periodic(Duration(milliseconds: 33), _timerCallback);
    super.initState();
  }

  void _startButton() {
    setState(() {
      if (this._stopwatch.isRunning)
        this._stopwatch.stop();
      else
        this._stopwatch.start();
    });
  }

  void _resetButton() {
    setState(() {
      this._stopwatch.reset();
      this._now = "0 s";
    });
  }

  String _getTime(int milliseconds) {
    double seconds = milliseconds.toDouble() / 1000;

    return '${seconds.toStringAsFixed(3)} s';
  }

  void _timerCallback(Timer t) {
    if (this._stopwatch.isRunning) {
      setState(() {
        this._now = this._getTime(this._stopwatch.elapsedMilliseconds);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            '${this._now}',
            style: Theme.of(context).textTheme.headline1,
          ),
          getButtonRow([
            FlatButton(
              child: Text(
                this._stopwatch.isRunning ? "Stop" : "Start",
              ),
              color: Theme.of(context).buttonColor,
              onPressed: () => this._startButton(),
            ),
            FlatButton(
              child: Text("Reset"),
              color: Theme.of(context).buttonColor,
              onPressed: () => this._resetButton(),
            ),
          ]),
        ],
      ),
    );
  }
}
