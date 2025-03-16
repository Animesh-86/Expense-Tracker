import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState(); // this will return the state
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 2000.0,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Groceries',
      amount: 500.0,
      date: DateTime.now(),
      category: Category.food, // this is the initial data
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true, // this will make the bottom sheet full screen
      context: context,
      builder:
          (ctx) => NewExpense(
            onAddExpense: _addExpense,
          ), // this will show the bottom sheet
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    }); // this will rebuild the widget
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    }); // this will rebuild the widget
    ScaffoldMessenger.of(
      context,
    ).clearMaterialBanners(); // this will remove the undo banner
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2), // this will show a snackbar
        content: const Text('Expense removed!'),
        action: SnackBarAction(
          label: 'UNDO', // undo button
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ), // this will show a snackbar
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No expenses added yet!'),
    ); // if there are no expenses, then show this

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpenseList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    } // if there are expenses, then show them
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Expenses Tracker',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed:
                _openAddExpenseOverlay, // this will open the bottom sheet
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('The chart will go here!'),
          Expanded(child: mainContent), // this will take the remaining space
        ],
      ),
    );
  }
}
