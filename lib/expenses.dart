import 'package:expense/widgets/expenses_list.dart';
import 'package:flutter/material.dart';
import 'package:expense/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registerExpenses = [
    Expense(
        title: 'TFT ticket',
        amount: 1249,
        date: DateTime.now(),
        category: Category.leisure),
    Expense(
        title: 'Laptop',
        amount: 2000,
        date: DateTime.now(),
        category: Category.work)
  ];
  void _openAddExpenseOverlay() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _openAddExpenseOverlay,
          )
        ],
      ),
      body: Column(
        children: [Expanded(child: ExpensesList(expenses: _registerExpenses))],
      ),
    );
  }
}
