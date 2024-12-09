import 'package:flutter/material.dart';
import 'package:quiz_app/expense_tracker_02/model/expense.dart';
import 'package:quiz_app/expense_tracker_02/widgets/expenses_list/expenses_item.dart';

class ExpensesList extends StatelessWidget{
  const ExpensesList({super.key, required this.expenses, required this.onRemoveExpense});
  
  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: expenses.length, 
      itemBuilder: (ctx,index) => Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(.70),
          margin: const EdgeInsets.symmetric(horizontal: 20),
        ),
        key: ValueKey(expenses[index]),
        child: ExpenseItem(expenses[index]),
        onDismissed: (direction){
          onRemoveExpense(expenses[index]);
        },
      ));
  }
}