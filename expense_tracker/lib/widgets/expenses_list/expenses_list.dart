import 'package:expense_tracker/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

import 'package:expense_tracker/models/expense.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expense> expenses;
  final void Function(Expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder:
          (ctx, index) => Dismissible(           // Dismissible is a widget that can be swiped away
            key: ValueKey(expenses[index]),         // key is used to identify the widget
            background: Container(
              color: Theme.of(context).colorScheme.error,
              margin: EdgeInsets.symmetric(horizontal: Theme.of(context).cardTheme.margin!.horizontal),
            ),    // this will use the card theme margin set in main.dart
            onDismissed: (direction) => onRemoveExpense(expenses[index]),  // on swipping, the expense will be removed
            child: ExpenseItem(expenses[index]),
          ), // after swipping, it will be removed
    ); //makes scrollable list
  }
}
