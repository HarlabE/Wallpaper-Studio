import 'package:flutter/material.dart';
import 'package:wallpaper_studio/pages/browsepage.dart';
import 'package:wallpaper_studio/pages/favouritepage.dart';
import 'package:wallpaper_studio/pages/homepage.dart';
import 'package:wallpaper_studio/pages/settings.dart';
import 'package:wallpaper_studio/widgets/nav_button_item.dart';

class NavButton extends StatelessWidget {
  const NavButton({
    super.key,
    required this.isHomeActive,
    required this.isBrowseActive,
    required this.isFavouriteActive,
    required this.isSettingsActive,
  });

  final bool isHomeActive;
  final bool isBrowseActive;
  final bool isFavouriteActive;
  final bool isSettingsActive;
  @override
  Widget build(BuildContext context) {
    return Row(
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
        const Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const Homepage(isBrowseActive: false, isHomeActive: true),
              ),
            );
          },
          child: NavButtonItem(
            icon: Icons.home,
            label: "Home",
            active: isHomeActive,
          ),
        ),
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
        GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SavedWallpapersScreen()),
            );
          },
          child: NavButtonItem(
            label: "Favourites",
            icon: Icons.favorite_border,
            active: isFavouriteActive,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SettingsScreen()),
            );
          },
          child: NavButtonItem(
            label: "Settings",
            icon: Icons.settings,
            active: isSettingsActive,
          ),
        ),
      ],
    );
  }
}
