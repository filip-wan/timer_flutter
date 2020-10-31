import 'package:flutter/material.dart';

Widget getAppBar() => PreferredSize(
      preferredSize: Size.fromHeight(60.0),
      child: AppBar(
        bottom: TabBar(
          tabs: [
            Tab(
              text: "Timer",
            ),
            Tab(
              text: "Stopwatch",
            )
          ],
        ),
      ),
    );
