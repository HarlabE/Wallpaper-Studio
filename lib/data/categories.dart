import 'package:wallpaper_studio/models/category.dart';

final List<Category> categories = const [
  Category(
    title: "Nature",
    subtitle: "Mountains, Forest and Landscapes",
    wallpaperCount: 3,
    imageUrl: "assets/img2.png",
  ),
  Category(
    title: "Abstract",
    subtitle: "Modern Geometric and artistic designs",
    wallpaperCount: 4,
    imageUrl: "assets/img1.png",
  ),
  Category(
    title: "Urban",
    subtitle: "Cities, architecture and street",
    wallpaperCount: 6,
    imageUrl: "assets/img3.png",
  ),
  Category(
    title: "Space",
    subtitle: "Cosmos, planets, and galaxies",
    wallpaperCount: 3,
    imageUrl: "assets/img4.png",
  ),
  Category(
    title: "Minimalist",
    subtitle: "Clean, simple, and elegant",
    wallpaperCount: 6,
    imageUrl: "assets/img5.png",
  ),
  Category(
    title: "Animals",
    subtitle: "Wildlife and nature photography",
    wallpaperCount: 4,
    imageUrl: "assets/img6.png",
  ),
];

final List<WallpaperItem> dummyWallpapers = [
  WallpaperItem(
    id: '1',
    title: 'Nature 1',
    tag: 'Nature',
    imageUrl: 'assets/nature1.png',
  ),
  WallpaperItem(
    id: '2',
    title: 'Nature 2',
    tag: 'Nature',
    imageUrl: 'assets/nature2.png',
  ),
  WallpaperItem(
    id: '3',
    title: 'Nature 3',
    tag: 'Nature',
    imageUrl: 'assets/nature3.png',
  ),
  WallpaperItem(
    id: '4',
    title: 'Nature 4',
    tag: 'Nature',
    imageUrl: 'assets/nature4.png',
  ),
  WallpaperItem(
    id: '5',
    title: 'Nature 5',
    tag: 'Nature',
    imageUrl: 'assets/nature5.png',
  ),
  WallpaperItem(
    id: '6',
    title: 'Nature 6',
    tag: 'Nature',
    imageUrl: 'assets/nature6.png',
  ),
];

const favouriteWallpaper = [];
