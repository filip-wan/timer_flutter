import 'package:flutter/material.dart';
import './colors.dart';

TextStyle tabLabelStyle = TextStyle(
  fontSize: 30.0,
  color: colors["text"],
  fontWeight: FontWeight.normal,
);

ThemeData buildThemeData() => ThemeData(
      tabBarTheme: TabBarTheme(
        labelStyle: tabLabelStyle,
        unselectedLabelStyle: tabLabelStyle,
      ),
      appBarTheme: AppBarTheme(
        color: colors["navbar"],
        brightness: Brightness.dark,
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.deepPurple,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
      ),
      textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 100,
              fontWeight: FontWeight.normal,
              color: colors["text"]),
          headline2: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.normal,
              color: colors["text"]),
          button: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.normal,
          )),
      brightness: Brightness.dark,
      backgroundColor: colors["background"],
      primaryColor: colors["background"],
      accentColor: colors["text"],
      canvasColor: colors["background"],
      buttonColor: colors["button"],
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
