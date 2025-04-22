import 'package:uuid/uuid.dart';

const uuid = Uuid(); // buat instance object

enum Category { food, travel, leisure, work }

class Expanses {
  Expanses({
    required this.title,
    required this.amount,
    required this.date,
    required this.category
  }) : id = uuid.v4(); // default value id

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
}
