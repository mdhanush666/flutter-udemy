import 'package:flutter/material.dart';
import 'package:quiz_app/meals_app_04/model/meals.dart';

class MealDetailScreen extends StatelessWidget{

  const MealDetailScreen({
    super.key,
    required this.meal,
    required this.onToggleFavorite
  });

  final Meal meal;

  final void Function(Meal meal) onToggleFavorite;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(onPressed: (){
            onToggleFavorite(meal);
          }, 
          icon: const Icon(Icons.star))
        ],
      ),
      body: ListView(
        children: [

          Image.network(
            meal.imageUrl,
            width: double.infinity, 
            height: 300,
            fit: BoxFit.cover,
          ),
          
          const SizedBox(height: 14),

          Text("Ingredients", textAlign: TextAlign.center, style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold
          )),

          const SizedBox(height: 14),

          for(final ingredient in meal.ingredients)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Text(
                ingredient, 
                textAlign: TextAlign.center, 
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface)
              ),
            ),

          const SizedBox(height: 24),

          Text("Steps", textAlign: TextAlign.center, style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold
          )),

          const SizedBox(height: 14),

          for(final step in meal.steps)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: Text(
                step, 
                textAlign: TextAlign.justify, 
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface)
              ),
            ),

          const SizedBox(height: 24),



          

        ],
      )
    );
  }
}