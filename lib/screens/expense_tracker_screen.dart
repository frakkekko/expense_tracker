import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/models/expense_category.dart';
import 'package:expense_tracker/widgets/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense/new_expense.dart';
import 'package:flutter/material.dart';

class ExpenseTrackerScreen extends StatefulWidget {

  const ExpenseTrackerScreen({super.key});

  @override
  State<ExpenseTrackerScreen> createState() {
    return _ExpenseTrackerScreenState();
  }
}

class _ExpenseTrackerScreenState extends State<ExpenseTrackerScreen> {
  final List<Expense> _registeredExpenses = [
    Expense(title: 'Flutter course', amount: 19.99, date: DateTime.now(), category: ExpenseCategory.work),
    Expense(title: 'Cinema', amount: 15.99, date: DateTime.now(), category: ExpenseCategory.leisure),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(context: context, builder: (ctx) => const NewExpense());
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expense Tracker'),
        actions: [
        IconButton(onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add))
      ],),
      body: Column(children: [
        ExpensesList(expenses: _registeredExpenses  )
      ],),
    );
  }
}
