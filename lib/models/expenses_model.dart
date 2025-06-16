import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid(); // buat instance object

enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work
};

class ExpansesModel {
  ExpansesModel(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4(); // default value id

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    // computed property getters
    return formatter.format(date);
  }
}

// TODO: - FOR CHART
class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  // Additional - Alternative Constructor Function
  // digunakan untuk memerkas semua pengeluaran uang kita dapatkan dan memfilternya sesuai kategori
  ExpenseBucket.forCategory(
    List<ExpansesModel> allExpenses,
    this.category,
  ) : expenses = allExpenses.where((expense) => expense.category == category).toList() ;

  final Category category;
  final List<ExpansesModel> expenses; // daftar expense untuk diolah

  // getter
  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      // final expense -> menyimpan variable pada sat compile.
      sum += expense.amount;
    }
    return sum;
  }
}
