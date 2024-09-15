import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/widgets/categories_grid_items.dart';
import 'package:meals_app/widgets/meals.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  void _selectCategory(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) { 
      return MealsScreen(title: 'title', meals: []) ;
    })) ;
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pick your category"),
      ),
      body: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children:  
           availableCategories.map((e) {return CategoryGridItem(category: e, onSelectCategory: () {
            _selectCategory(context);
           },);} ).toList(),
      
      ),
    );
  }
} 
