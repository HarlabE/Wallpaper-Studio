class Category {
  final String title;
  final String subtitle;
  final int wallpaperCount;
  final String imageUrl;

  const Category({
    required this.title,
    required this.subtitle,
    required this.wallpaperCount,
    required this.imageUrl,
  });
}

class NatureCategory {
  final String name;
  final String imageUrl;
  final bool isFavorite;

  const NatureCategory({
    required this.name,
    required this.imageUrl,
    this.isFavorite = false,
  });
}

class Wallpaper {
  final String name;
  final String description;
  final List<String> tags;
  final String imageUrl;

  const Wallpaper({
    required this.name,
    required this.description,
    required this.tags,
    required this.imageUrl,
  });
}

class WallpaperItem {
  final String id;
  final String title;
  final String tag;
  final String imageUrl;

  WallpaperItem({
    required this.id,
    required this.title,
    required this.tag,
    required this.imageUrl,
  });
}
