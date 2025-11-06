import 'package:flutter/material.dart';
import 'package:wallpaper_studio/models/category.dart';

class CategoryListItem extends StatelessWidget {
  final Category category;
  const CategoryListItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            category.imageUrl,
            width: 120,
            height: 90,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 16),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                category.subtitle,
                style: const TextStyle(fontSize: 13, color: Colors.black54),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${category.wallpaperCount} wallpapers',
                  style: const TextStyle(fontSize: 11, color: Colors.black54),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
