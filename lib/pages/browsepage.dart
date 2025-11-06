import 'package:flutter/material.dart';
import 'package:wallpaper_studio/widgets/grid_view.dart';
import 'package:wallpaper_studio/widgets/list_view.dart';
import 'package:wallpaper_studio/widgets/nav_button.dart';
import 'package:wallpaper_studio/widgets/small_screen_browsepage.dart';

class Browsepage extends StatefulWidget {
  const Browsepage({super.key});

  @override
  State<Browsepage> createState() => _BrowsepageState();
}

class _BrowsepageState extends State<Browsepage> {
  bool isList = false;
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    Widget screen = screenWidth <= 700
        ? SmallScreenBrowsepage(isBrowseActive: true, isHomeActive: false)
        : Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              elevation: 1,
              toolbarHeight: 60,
              titleSpacing: 20,
              title: NavButton(
                isHomeActive: false,
                isBrowseActive: true,
                isFavouriteActive: false,
                isSettingsActive: false,
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [Color(0xFFF9A825), Color(0xFFE91E63)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ).createShader(bounds),
                    child: const Text(
                      'Browse Categories',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,

                        color: Colors.white,
                      ),
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
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                isList = false;
                              });
                            },
                            icon: Icon(
                              Icons.grid_view,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                isList = true;
                              });
                            },
                            icon: Icon(
                              Icons.list,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  if (isList)
                    Expanded(child: CustomList())
                  else
                    Expanded(child: CustomGrid()),
                ],
              ),
            ),
          );

    return screen;
  }
}
