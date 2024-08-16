import 'package:expense_tracker/config/config.dart';
import 'package:expense_tracker/models/expense_category.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class Expense {
  final String id;

  final String title;
  final double amount;
  final DateTime date;
  final ExpenseCategory category;

  Expense({required this.title, required this.amount, required this.date, required this.category})
      : id = const Uuid().v4();

  String get formattedDate {
    return DateFormat(Config.dateFormat).format(date).toString();
  }
}
