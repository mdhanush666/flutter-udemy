import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
// import "package:quiz_app/meals_app_04/screen/categories.dart";
import "package:quiz_app/meals_app_04/screens/tabs.dart";

// import 'package:flutter/services.dart';
// import 'package:quiz_app/todo_03/keys/keys.dart';

// import "package:quiz_app/quiz_01/quiz.dart";
// import "package:quiz_app/expense_tracker_02/expenses.dart";

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 23, 4, 76));

var kDarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 0, 32, 24));

void main() {

  //.................Quiz APP..........................

  // runApp(const Quiz()); // Quiz APP


  //.................Expense Tracker APP................

  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]).then((fn) {

    // runApp(MaterialApp(
    //   darkTheme: ThemeData.dark()
    //       .copyWith(useMaterial3: true, colorScheme: kDarkColorScheme),
    //   theme: ThemeData().copyWith(
    //       useMaterial3: true,
    //       // scaffoldBackgroundColor: const Color.fromARGB(255, 68, 0, 255),
    //       colorScheme: kColorScheme,
    //       appBarTheme: const AppBarTheme().copyWith(
    //           backgroundColor: kColorScheme.onPrimaryContainer,
    //           foregroundColor: kColorScheme.primaryContainer),
    //       cardTheme: const CardTheme().copyWith(
    //           color: kColorScheme.secondaryContainer,
    //           margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10)),
    //       elevatedButtonTheme: ElevatedButtonThemeData(
    //           style: ElevatedButton.styleFrom(
    //               backgroundColor: kDarkColorScheme.primaryContainer,
    //               foregroundColor: kDarkColorScheme.onPrimaryContainer))),
    //   themeMode: ThemeMode.system,
    //   debugShowCheckedModeBanner: false,
    //   title: "Expense Tracker APP",
    //   home: const Expenses(),
    // )); // Expense Tracker APP
//   });


  //.................TODO APP..........................

  // runApp(MaterialApp(
  //   title: "TODO APP",
  //   home: Scaffold(
  //     appBar: AppBar(
  //       title: const Text("Flutter Todo"),
  //     ),
  //     body: const Keys(),
  //   ),
  // )); // Todo APP


  //.................Meal APP..........................

  final theme = ThemeData(
    useMaterial3 : true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: const Color.fromARGB(255, 0, 0, 0)      
    ),
    textTheme: GoogleFonts.latoTextTheme()
  );

  runApp(
    MaterialApp(
      theme: theme,
      title:"Meals APP",
      home: const TabScreen()  
    )
  );

}
