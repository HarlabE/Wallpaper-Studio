import 'package:flutter/material.dart';
import 'package:wallpaper_studio/widgets/grid_view.dart';
import 'package:wallpaper_studio/widgets/nav_button.dart';
import 'package:wallpaper_studio/widgets/small_screen_homepage.dart';

class Homepage extends StatelessWidget {
  const Homepage({
    super.key,
    required this.isBrowseActive,
    required this.isHomeActive,
  });

  final bool isHomeActive;
  final bool isBrowseActive;
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    Widget screen = (screenWidth <= 700)
        ? SmallScreenHomepage(
            isBrowseActive: isBrowseActive,
            isHomeActive: isHomeActive,
          )
        : Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              elevation: 1,
              toolbarHeight: 60,
              titleSpacing: 20,
              title: NavButton(
                isHomeActive: true,
                isBrowseActive: false,
                isFavouriteActive: false,
                isSettingsActive: false,
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
                          text: "Discover ",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            color: Colors.orange.shade700,
                          ),
                        ),
                        TextSpan(
                          text: "Beautiful ",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            color: Colors.orange.shade400,
                          ),
                        ),
                        TextSpan(
                          text: "Wallpapers",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            color: Colors.red.shade400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Discover curated collections of stunning wallpapers. Browse by category, preview in full-screen, and set your favorites.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Categories",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Colors.black87,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "See All",
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  CustomGrid(),
                ],
              ),
            ),
          );

    return screen;
  }
}
