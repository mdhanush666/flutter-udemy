import 'package:flutter/material.dart';
import 'package:quiz_app/todo_03/keys/checkable_todo_item.dart';

class Todo{
  const Todo(this.text, this.priority);

  final String text;
  final Priority priority;
}

class Keys extends StatefulWidget{
  const Keys({super.key});

  @override
  State<Keys> createState() {
    return _KeysState();
  }
}

class _KeysState extends State<Keys>{
  
  var _orderBy = 'asc';

  final _todos = [
    const Todo(
      "Learn Flutter", 
      Priority.urgent
    ),
    const Todo(
      "Practice Flutter", 
      Priority.normal
    ),
    const Todo(
      "Explore other courses", 
      Priority.low
    ),
  ];

  List<Todo> get _orderedTodo{
    final sortedTools = List.of(_todos);
    sortedTools.sort((a,b){
      final bComesAfterA = a.text.compareTo(b.text);
      return _orderBy == 'asc'? bComesAfterA: -bComesAfterA;
    });
    return sortedTools;
  }

  void _changeOrder(){
    setState(() {
      _orderBy = _orderBy == 'asc'? 'desc':'asc';      
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: TextButton.icon(

            icon: Icon(_orderBy == 'asc'? Icons.arrow_upward : Icons.arrow_downward),

            onPressed: _changeOrder, 

            label: Text('Sort ${_orderBy == 'asc'? "Decending":"Ascending"}')
          ),
        ),
        
        Expanded(
          child: Column(
            children: [
              for(final todo in _orderedTodo)
              CheckableTodoItem(
                key: ObjectKey(todo),
                todo.text,
                todo.priority
              )
            ],
          ) 
        )

      ],
    );
  }
}