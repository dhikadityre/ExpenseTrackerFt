import 'package:expense_tracker_ft/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker_ft/models/expenses_model.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<ExpansesModel> _registeredExpenses = [
    ExpansesModel(
      title: 'Flutter Course',
      amount: 19.98,
      date: DateTime.now(),
      category: Category.work,
    ),
    ExpansesModel(
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
          Expanded(child: ExpensesList(expenses: _registeredExpenses)),
        ],
      ),
    );
  }
}
