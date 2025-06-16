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

  void _didOpenExpenseOverlay() {
    showModalBottomSheet(
      context: context, 
      builder: (ctx) => const Text(('Modal Bottom sheet')),
    );
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, false),
        ),
        title: const Text('Flutter Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _didOpenExpenseOverlay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          const Text('The Chart'),
          Expanded(child: ExpensesList(expenses: _registeredExpenses)),
        ],
      ),
    );
  }
}
