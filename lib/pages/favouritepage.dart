import 'package:flutter/material.dart';
import 'package:wallpaper_studio/data/categories.dart';
import 'package:wallpaper_studio/pages/browsepage.dart';
import 'package:wallpaper_studio/pages/homepage.dart';
import 'package:wallpaper_studio/pages/settings.dart';
import 'package:wallpaper_studio/widgets/favourite_wallpaper_card.dart';
import 'package:wallpaper_studio/widgets/nav_button.dart';
import 'package:wallpaper_studio/widgets/nav_button_Item.dart';

class SavedWallpapersScreen extends StatelessWidget {
  const SavedWallpapersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final displayList = [...dummyWallpapers, ...dummyWallpapers];
    final screenWidth = MediaQuery.of(context).size.width;
    Widget? mobileDrawer = screenWidth <= 700
        ? Drawer(
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
                    active: false,
                  ),
                ),SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Browsepage(),
                      ),
                    );
                  },
                  child: NavButtonItem(
                    label: "Browse",
                    icon: Icons.explore,
                    active: true,
                  ),
                ),SizedBox(height: 20),
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
                    active: false,
                  ),
                ),SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingsScreen(),
                      ),
                    );
                  },
                  child: NavButtonItem(
                    label: "Settings",
                    icon: Icons.settings,
                    active: false,
                  ),
                ),
              ],
            ),
          )
        : null;
    return Scaffold(
      endDrawer: mobileDrawer,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: screenWidth <= 700
            ? Row(
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
              )
            : NavButton(
                isHomeActive: false,
                isBrowseActive: false,
                isFavouriteActive: true,
                isSettingsActive: false,
              ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;
          final int crossAxisCount;

          if (screenWidth < 700) {
            crossAxisCount = 2;
          } else if (screenWidth < 1100) {
            crossAxisCount = 4;
          } else {
            crossAxisCount = 6;
          }

          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 16.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Gradient Text
                      ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [Color(0xFFF9A825), Color(0xFFE91E63)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ).createShader(bounds),
                        child: const Text(
                          'Saved Wallpapers',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,

                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Your saved wallpapers collection',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SliverPadding(
                padding: const EdgeInsets.all(24.0),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,

                    childAspectRatio: 0.6,
                  ),
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return FavouriteWallpaperCard(item: displayList[index]);
                  }, childCount: displayList.length),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
