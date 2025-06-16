import 'package:expense_tracker_ft/models/expenses_model.dart';
import 'package:expense_tracker_ft/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemove});

  final List<ExpansesModel> expenses;
  final void Function(ExpansesModel expense) onRemove;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index]),
        background: Container( // BG Merah
          color: Theme.of(context).colorScheme.error,
          margin: Theme.of(context).cardTheme.margin,
        ),
        onDismissed: (direcion) {
          onRemove(expenses[index]);
        },
        child: ExpensesItem(expenses[index]),
      ),
    );
  }
}
