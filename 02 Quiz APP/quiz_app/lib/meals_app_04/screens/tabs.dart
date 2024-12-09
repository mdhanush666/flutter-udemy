import 'package:flutter/material.dart';
import 'package:quiz_app/meals_app_04/model/meals.dart';
import 'package:quiz_app/meals_app_04/screens/categories.dart';
import 'package:quiz_app/meals_app_04/screens/meals.dart';
import 'package:quiz_app/meals_app_04/widgets/main_drawer.dart';

class TabScreen extends StatefulWidget{
  
  const TabScreen({super.key,});

  // final void Function(String identifier) onSelectScreen;
  
  @override
  State<TabScreen> createState(){
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabScreen>{

  int _selectedPageIndex = 0;

  final List<Meal> _favoriteMeals = [];

  void showMsgFav(String title, Color bgColor){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(title, style: const TextStyle(color: Colors.white),),
      backgroundColor: bgColor,
      elevation: 5,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
    ));
  }

  void _toggleMealFavoriteStatus(Meal meal){
    ScaffoldMessenger.of(context).clearSnackBars();
    final isExisting = _favoriteMeals.contains(meal);

    if(isExisting){
      setState(() {
        _favoriteMeals.remove(meal);
        showMsgFav("Meal Removed From Favorite", Colors.red.shade900);
      });
    }
    else{
      setState(() {
        _favoriteMeals.add(meal);
        showMsgFav('Meal Added to Favorite', Colors.green.shade900);
      });
    }

  }

  void _setScreen(String identifier){
    if(identifier == "filters"){
      Navigator.of(context).pop();
    }
    else{
      Navigator.of(context).pop();
    }
  }

  void selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    Widget activePage = CategoriesScreen(onToggleFavorite: _toggleMealFavoriteStatus);
    var activePageTitle = "Categories";

    if(_selectedPageIndex == 1){
      activePage = MealsScreen(meals: _favoriteMeals, onToggleFavorite: _toggleMealFavoriteStatus,);
      activePageTitle = "Your Favorities";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelectScreen: _setScreen,),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: "Categories"),

          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites"),

        ],
      ),
    );
  }
}