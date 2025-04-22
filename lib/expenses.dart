import 'package:expense_tracker_ft/expenses_list.dart';
import 'package:expense_tracker_ft/models/expenses.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expanses> _registeredExpanses = [
    Expanses(
      title: 'Flutter Course',
      amount: 19.98,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expanses(
      title: 'Cinema',
      amount: 15.0,
      date: DateTime.now(),
      category: Category.leisure,
    )
  ];

  @override
  Widget build(context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('The Chart'),
          Expanded(child: ExpensesList(expanses: _registeredExpanses)),
        ],
      ),
    );
  }
}
