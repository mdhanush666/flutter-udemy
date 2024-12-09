import 'dart:math';

import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget{
  const StartScreen({super.key});

  @override
  State<StartScreen> createState(){
    return _StartScreenState();
  }
}

class _StartScreenState extends State<StartScreen>{

  var img = 'assets/0.png';

  void rollDice(){
    var random = Random();
    var imgIndex = random.nextInt(6)+1;

    setState(() {
      img = "assets/$imgIndex.png";
    });
  }
  @override
  Widget build(BuildContext context) {

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          
          Image.asset(img, width: 300),

          const SizedBox(height: 50),

          ElevatedButton(
            onPressed: rollDice, 
            child: const Text("Roll")
          )

        ],
      ),
    );
  }
}