import 'package:flutter/material.dart';
import 'package:wallpaper_studio/data/categories.dart';
import 'package:wallpaper_studio/widgets/list_item.dart';

class CustomList extends StatelessWidget {
  const CustomList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: categories.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        return CategoryListItem(category: categories[index]);
      },
    );
  }
}
