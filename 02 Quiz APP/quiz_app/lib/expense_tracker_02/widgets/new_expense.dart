import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/expense_tracker_02/model/expense.dart';
import 'dart:io';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpense(); 
  }
}

class _NewExpense extends State<NewExpense> {
  // var _enteredTitle = '';

  // void _saveTitleInput(String inputValue){
  //   _enteredTitle = inputValue;
  // }

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.food;

  void showAlertDialog(){
    if(Platform.isAndroid){
      showDialog(
        context: context, 
        builder: (ctx)=> AlertDialog(
          title: const Text("Invalid Input"),
          content: const Text("All Fields must be filled!"),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.pop(ctx);
              }, 
              child: const Text("Okay")
            )
          ],
        )
      );
    }
    else{
      showCupertinoDialog(
        context: context, 
        builder: (ctx)=> CupertinoAlertDialog(
          title: const Text("Invalid Input"),
          content: const Text("All Fields must be filled!"),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.pop(ctx);
              }, 
              child: const Text("Okay")
            )
          ],
        )
      );
    }
  }

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final isAmountIvalid = enteredAmount == null || enteredAmount <= 0;

    if (_titleController.text.trim().isEmpty ||
        isAmountIvalid ||
        _selectedDate == null) {
      
      showAlertDialog();
      return;
    }

    widget.onAddExpense(Expense(
        title: _titleController.text,
        amount: enteredAmount,
        date: _selectedDate!,
        category: _selectedCategory));

    Navigator.pop(context);
  }

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    var getDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);

    setState(() {
      _selectedDate = getDate;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSize = MediaQuery.of(context).viewInsets.bottom;

    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, keyboardSize + 16),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _titleController,
                // onChanged: _saveTitleInput,
                maxLength: 50,
                decoration: const InputDecoration(label: Text("Title")),
              ),
              Row(children: [
                Expanded(
                  child: TextField(
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        prefixText: "Rs : ", label: Text("Amount")),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(_selectedDate == null
                          ? "No Date Selected"
                          : formatter.format(_selectedDate!)),
                      IconButton(
                          onPressed: _presentDatePicker,
                          icon: const Icon(Icons.date_range_outlined))
                    ],
                  ),
                ),
              ]),
              const SizedBox(height: 20),
              Row(
                children: [
                  DropdownButton(
                      // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      value: _selectedCategory,
                      items: Category.values
                          .map((category) => DropdownMenuItem(
                                child: Text(category.name.toUpperCase()),
                                value: category,
                              ))
                          .toList(),
                      onChanged: (value) {
                        if (value == null) {
                          return;
                        }
                        setState(() {
                          _selectedCategory = value;
                        });
                      }),
                  const Spacer(),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Cancel")),
                  const SizedBox(width: 10),
                  ElevatedButton(
                      onPressed: _submitExpenseData,
                      child: const Text("Save Expense")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
