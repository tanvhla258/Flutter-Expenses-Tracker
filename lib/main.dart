import 'package:flutter/material.dart';
import 'package:expense/expenses.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 155, 80));
var kDarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 38, 87, 124));
void main() {
  runApp(MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
          )),
          useMaterial3: true,
          colorScheme: kDarkColorScheme),
      theme: ThemeData().copyWith(
          appBarTheme: const AppBarTheme().copyWith(
              backgroundColor: kColorScheme.onPrimaryContainer,
              foregroundColor: kColorScheme.primaryContainer),
          useMaterial3: true,
          cardTheme: const CardTheme().copyWith(
              color: kColorScheme.secondaryContainer,
              margin: const EdgeInsets.all(16)),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          )),
          textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: kColorScheme.onSecondaryContainer,
                  fontSize: 18)),
          colorScheme: kColorScheme),
      themeMode: ThemeMode.system,
      home: const Expenses()));
}
