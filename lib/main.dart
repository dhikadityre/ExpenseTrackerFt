import 'package:flutter/material.dart';
import 'package:expense_tracker_ft/widgets/expenses.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true), // styling theme 
      home: const Expenses(),
    ),
  );
}