import 'package:flutter/material.dart';
import 'package:quiz_app/meals_app_04/model/category.dart';

class CategoryGridItem extends StatelessWidget{

  const CategoryGridItem({
    super.key,
    required this.category,
    required this.onSelectCategory
  });

  final Category category;
  final void Function() onSelectCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectCategory,
      splashColor: Theme.of(context).primaryColorLight,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 34),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.50),
              category.color.withOpacity(1)
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight
          )
        ),
        child: Text(
          category.title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onSurface
          ),
        ),
      ),
    );
  }
}