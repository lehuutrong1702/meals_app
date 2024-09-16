import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title, maxLines: 2,
          textAlign: TextAlign.center,
          softWrap: true,
          overflow: TextOverflow.ellipsis, // very long text ...
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
        actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.star))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "Ingredients",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 12,
            ),
            for (final ingredient in meal.ingredients)
              Text(
                ingredient,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "Steps",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold),
            ),
            for (final step in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 16),
                child: Text(
                  step,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Theme.of(context).colorScheme.onBackground),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
