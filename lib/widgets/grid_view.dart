import 'package:flutter/material.dart';
import 'package:wallpaper_studio/data/categories.dart';
import 'package:wallpaper_studio/widgets/category_card.dart';

class CustomGrid extends StatelessWidget {
  const CustomGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1.45,
        ),
        itemBuilder: (context, index) {
          return CategoryCard(category: categories[index]);
        },
      ),
    );
  }
}
