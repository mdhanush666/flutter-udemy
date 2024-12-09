import 'package:dice__roll/start_screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyClass());
}

class  MyClass extends StatelessWidget{
  const MyClass({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dice Roll APP",
      home: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 36, 0, 36),
              Color.fromARGB(255, 128, 0, 128),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topLeft
          )
        ),
        child: const StartScreen(),
      ),
    );
  }
}
