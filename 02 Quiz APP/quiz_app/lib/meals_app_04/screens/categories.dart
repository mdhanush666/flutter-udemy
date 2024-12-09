import 'package:flutter/material.dart';
import 'package:quiz_app/meals_app_04/data/dummy_data.dart';
import 'package:quiz_app/meals_app_04/model/category.dart';
import 'package:quiz_app/meals_app_04/model/meals.dart';
import 'package:quiz_app/meals_app_04/screens/meals.dart';
import 'package:quiz_app/meals_app_04/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget{
  
  const CategoriesScreen({super.key, required this.onToggleFavorite});

  final void Function(Meal) onToggleFavorite;
  
    void selectCategory(BuildContext context, Category category){
      
      final filteredMeals = dummyMeals.where((meal)=> meal.categories.contains(category.id)).toList();
      
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => MealsScreen(
            title: category.title,
            meals: filteredMeals,
            onToggleFavorite: onToggleFavorite,
          )
        )
      );
    }

  @override
  Widget build(BuildContext context) {

    return GridView(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20
        ),
        
        children: [

          for(final category in availableCategories)
            CategoryGridItem(
              category: category, 
              onSelectCategory: (){
                selectCategory(context, category);
              }
            )

        ],
      );    
  }
}