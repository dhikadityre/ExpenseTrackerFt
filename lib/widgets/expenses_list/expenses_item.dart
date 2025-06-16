import 'package:flutter/material.dart';
import 'package:expense_tracker_ft/models/expenses_model.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem(this.expanse, {super.key});

  final ExpansesModel expanse;

  @override
  Widget build(context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expanse.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text(
                    '\$${expanse.amount.toStringAsFixed(2)}'), // 12.3433 -> 12.34
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expanse.category]),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(expanse.formattedDate)
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
