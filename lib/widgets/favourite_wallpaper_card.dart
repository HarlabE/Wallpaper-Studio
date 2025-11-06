import 'package:flutter/material.dart';
import 'package:wallpaper_studio/models/category.dart';

class FavouriteWallpaperCard extends StatelessWidget {
  final WallpaperItem item;

  const FavouriteWallpaperCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            item.imageUrl,
            fit: BoxFit.cover,

            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey.shade100,
                child: const Icon(Icons.broken_image, color: Colors.grey),
              );
            },
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.8),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 12.0,
            left: 12.0,
            right: 12.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6.0,
                    vertical: 2.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Text(
                    item.tag,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            top: 12.0,
            right: 12.0,
            child: Container(
              padding: const EdgeInsets.all(6.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.favorite,
                color: Colors.orange.shade700,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
