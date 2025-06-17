import 'package:expense_tracker_ft/widgets/bottomsheets/new_expense.dart';
import 'package:expense_tracker_ft/widgets/chart/chart.dart';
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
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _didAddExpense),
    );
  }

  void _didAddExpense(ExpansesModel expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _didRemoveExpense(ExpansesModel expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars(); // clear snakcbar tanpa perlu menunggu 3 detik jika remove dilakukan dengan cepat dan melibatkan beberapa item
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense Deleted.'),
        action: SnackBarAction(
          label: 'Undo', 
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(context) {
    Widget mainContent = const Center(
      child: Text('No expenses found. Start adding some!'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemove: _didRemoveExpense,
      );
    }

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
          Chart(expenses: _registeredExpenses,),
          Expanded(child: mainContent),
        ],
      ),
    );
  }
}
