import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  final List<Expense> expenses;
  const ExpensesList({super.key, required this.expenses});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: MediaQuery.of(context).size.height * 0.5, width: MediaQuery.of(context).size.width, child: ListView.builder(itemCount: expenses.length, itemBuilder: (ctx, index) => ExpenseItem(expenses[index]),));
  }
}