import 'package:expense_tracker_ft/models/expenses.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expanses});

  final List<Expanses> expanses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: expanses.length, itemBuilder: (ctx, index) => Text(expanses[index].title));
    return ListView.builder(
        itemCount: expanses.length,
        itemBuilder: (ctx, index) {
          return Text(expanses[index].title);
        });
  }
}
