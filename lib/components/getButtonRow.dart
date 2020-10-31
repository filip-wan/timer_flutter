import 'package:flutter/material.dart';

Widget getButtonRow(List<Widget> buttons) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: buttons
        .map((element) => Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: element,
              ),
            ))
        .toList());
