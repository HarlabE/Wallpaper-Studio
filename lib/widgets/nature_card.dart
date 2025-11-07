import 'package:flutter/material.dart';
import 'package:wallpaper_studio/data/categories.dart';
import 'package:wallpaper_studio/models/category.dart';

class NatureCategoryCard extends StatefulWidget {
  final NatureCategory category;
  final VoidCallback? onTap;

  const NatureCategoryCard({super.key, required this.category, this.onTap});

  @override
  State<NatureCategoryCard> createState() => _NatureCategoryCardState();
}

class _NatureCategoryCardState extends State<NatureCategoryCard> {
  late bool fav;
  @override
  void initState() {
    fav = widget.category.isFavorite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              widget.category.imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  Center(child: Icon(Icons.broken_image)),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.7),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 12,
              left: 12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.category.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Nature',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: widget.category.isFavorite
                      ? Colors.redAccent
                      : Colors.black54,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: Icon(
                    widget.category.isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.white,
                    size: 18,
                  ),
                  onPressed: () {
                    // Handle favorite toggle

                    if (widget.category.isFavorite) {
                      favouriteWallpaper.add(widget.category);
                      setState(() {
                        fav = !fav;
                      });
                    } else {
                      favouriteWallpaper.remove(widget.category);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
