import 'package:expense/widgets/chart/chart.dart';
import 'package:expense/widgets/expenses_list.dart';
import 'package:expense/widgets/new_expense.dart';
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
  ];
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(
        onAddExpense: _addExpense,
      ),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registerExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registerExpenses.indexOf(expense);
    setState(() {
      _registerExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _registerExpenses.insert(expenseIndex, expense);
              });
            }),
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted')));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent =
        const Center(child: Text('No expenses found. Start adding some!'));
    if (_registerExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registerExpenses,
        onRemoveExpense: _removeExpense,
      );
    }
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
        children: [
          Chart(expenses: _registerExpenses),
          Expanded(child: mainContent)
        ],
      ),
    );
  }
}
