import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 237, 190, 87),
); // This will create a color scheme

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        colorScheme: kColorScheme,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kColorScheme.primaryContainer,   // this will change the app bar color
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5), // this will change the card color
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,  // this will change the button color
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: kColorScheme.onSecondaryContainer,  // this will change the text color
              ),
            ),
      ),
      home: const Expenses(),
    ),
  );
}
