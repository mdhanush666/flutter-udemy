import 'package:flutter/material.dart';
import 'package:quiz_app/meals_app_04/model/meals.dart';
import 'package:quiz_app/meals_app_04/screens/meal_detail_screen.dart';
import 'package:quiz_app/meals_app_04/widgets/meals_item.dart';

class MealsScreen extends StatelessWidget{

  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
    required this.onToggleFavorite
  });

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavorite;

  void selectMeal(BuildContext context, Meal meal){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (ctx)=> MealDetailScreen(meal: meal, onToggleFavorite: onToggleFavorite))
    );
  }

  @override
  Widget build(BuildContext context) {

    Widget content = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "No Meals Found!",
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Try Selecting Different Category",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface
            ),
          )
        ],
      ),
    );

    if(meals.isNotEmpty){
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) => MealsItem(meal: meals[index], onSelectMeal: selectMeal,),
      );
    }

    if(title == null){
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content
    );
  }
}