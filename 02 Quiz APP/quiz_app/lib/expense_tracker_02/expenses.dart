import 'package:flutter/material.dart';
import 'package:quiz_app/expense_tracker_02/widgets/chart/chart.dart';
import 'package:quiz_app/expense_tracker_02/widgets/expenses_list.dart';
import 'package:quiz_app/expense_tracker_02/model/expense.dart';
import 'package:quiz_app/expense_tracker_02/widgets/new_expense.dart';

class Expenses extends StatefulWidget{

  const Expenses({super.key});
  
  @override
  State<Expenses> createState(){
    return _ExpensesState();    
  }
}

class _ExpensesState extends State<Expenses>{

  final List<Expense> _registeredExpenses = [
    
    Expense(
      title: "Flutter Course",
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work
    ), 
    
    Expense(
      title: "Movie", 
      amount: 30.00, 
      date: DateTime.now(),
      category: Category.leisure
    ),
  
  ];

  void _openAddExpenseOverlay(){
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense)
    );
  }

  void _addExpense(Expense expense){
    setState(() {
      _registeredExpenses .add(expense);
    });
  }

  void _removeExpense(Expense expense){
    final expenseIndex = _registeredExpenses.indexOf(expense);

    setState(() {
      _registeredExpenses.remove(expense);
    });
    
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        content: const Text("Expense Deleted Successfully"),
        action: SnackBarAction(
          label: "UNDO",
          onPressed: (){
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;

    Widget mainContent = const Center(
      child: Text("No Expense Found!"),
    );

    if(_registeredExpenses.isNotEmpty){
      mainContent = ExpensesList(expenses: _registeredExpenses, onRemoveExpense: _removeExpense);
    }

    return Scaffold(      
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Flutter Expense Tracker", style: TextStyle(color: Colors.white),),
        backgroundColor: const Color.fromARGB(255, 10, 10, 50),
        actions: <Widget>[
          IconButton(
            onPressed: _openAddExpenseOverlay, 
            icon: const Icon(Icons.add, color: Colors.white),
            tooltip: "Add",
          )
        ],
      ),

      body: width < 600? Column(
        children: [
          Chart(expenses: _registeredExpenses),
          
          Expanded(
            child: mainContent
          )
        ],
      )
      : Row(
        children: [
          Expanded(child: Chart(expenses: _registeredExpenses)),
          
          Expanded(
            child: mainContent
          )
        ],
      )
    );
  }
}