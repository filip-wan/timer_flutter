import 'package:flutter/material.dart';
import 'package:timer_flutter/pages/timerPage.dart';
import 'package:timer_flutter/pages/stopwatchPage.dart';
import 'components/getAppBar.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          appBar: getAppBar(),
          body: TabBarView(
            children: <Widget>[TimerPage(), StopwatchPage()],
          ),
        ),
      );
}
