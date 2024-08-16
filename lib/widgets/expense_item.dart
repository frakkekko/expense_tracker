import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/models/expense_contegory_icons.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  final Expense expense;

  const ExpenseItem(this.expense, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Column(children: [
          Text(expense.title),
          const SizedBox(height: 6,),
          Row(children: [
            Text('€${expense.amount.toStringAsFixed(2)}'),
            const Spacer(),
            Row(children: [
              Icon(expenseCategoryIcons[expense.category]),
              const SizedBox(width: 4,),
              Text(expense.formattedDate)
            ],)
          ],)
        ],)
      ),
    );
  }
}
