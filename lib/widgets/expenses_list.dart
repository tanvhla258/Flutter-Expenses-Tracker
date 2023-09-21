import 'package:expense/models/expense.dart';
import 'package:expense/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.onRemoveExpense, required this.expenses});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
          onDismissed: (direction) {
            onRemoveExpense(expenses[index]);
          },
          background: Container(
              margin: Theme.of(context).cardTheme.margin,
              color: Theme.of(context).colorScheme.error.withOpacity(0.5)),
          key: ValueKey(expenses[index]),
          child: ExpenseItem(expenses[index])),
    );
  }
}
