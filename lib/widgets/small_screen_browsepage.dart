import 'package:flutter/material.dart';
import 'package:wallpaper_studio/data/categories.dart';
import 'package:wallpaper_studio/pages/browsepage.dart';
import 'package:wallpaper_studio/pages/favouritepage.dart';
import 'package:wallpaper_studio/pages/homepage.dart';
import 'package:wallpaper_studio/pages/settings.dart';
import 'package:wallpaper_studio/widgets/category_card.dart';
import 'package:wallpaper_studio/widgets/nav_button_item.dart';

class SmallScreenBrowsepage extends StatelessWidget {
  const SmallScreenBrowsepage({
    super.key,
    required this.isBrowseActive,
    required this.isHomeActive,
  });
  final bool isHomeActive;
  final bool isBrowseActive;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Image.asset('assets/Vector.png'),
            const SizedBox(width: 8),
            const Text(
              'Wallpaper Studio',
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Homepage(
                      isBrowseActive: true,
                      isHomeActive: false,
                    ),
                  ),
                );
              },
              child: NavButtonItem(
                icon: Icons.home,
                label: "Home",
                active: isHomeActive,
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Browsepage()),
                );
              },
              child: NavButtonItem(
                label: "Browse",
                icon: Icons.explore,
                active: isBrowseActive,
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SavedWallpapersScreen(),
                  ),
                );
              },
              child: NavButtonItem(
                label: "Favourites",
                icon: Icons.favorite_border,
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsScreen(),
                  ),
                );
              },
              child: NavButtonItem(label: "Settings", icon: Icons.settings),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Browse ",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.orange.shade700,
                    ),
                  ),

                  TextSpan(
                    text: "Categories",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.red.shade400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Explore our curated collections of stunning wallpapers",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 24),

            Expanded(
              child: ListView.builder(
                itemCount: categories.length,

                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: SizedBox(
                      height: 400,
                      child: CategoryCard(category: categories[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
