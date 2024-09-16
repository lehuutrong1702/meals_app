import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/meal_provider.dart';

import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/meals.dart';

class TabsScreen extends ConsumerStatefulWidget {
  TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {

    final meals = ref.watch(mealsProvider);

    Widget activePage = CategoriesScreen();
    String activePageTitle = "Categories";

    if (_selectedPageIndex == 1) {
      setState(() {
        activePage = MealsScreen( meals: meals);
        activePageTitle = "Favorites";
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPageIndex,
          onTap: (index) {
            setState(() {
              _selectedPageIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.set_meal), label: "Categories"),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites"),
          ]),
    );
  }
}
