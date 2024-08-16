import 'package:expense_tracker/models/expense_category.dart';
import 'package:flutter/material.dart';

const Map<ExpenseCategory, IconData> expenseCategoryIcons = {
    ExpenseCategory.food: Icons.lunch_dining,
    ExpenseCategory.leisure: Icons.movie,
    ExpenseCategory.travel: Icons.flight_takeoff,
    ExpenseCategory.work: Icons.work
  };