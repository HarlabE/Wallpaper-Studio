import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wallpaper_studio/models/category.dart';
import 'package:wallpaper_studio/pages/browsepage.dart';
import 'package:wallpaper_studio/pages/favouritepage.dart';
import 'package:wallpaper_studio/pages/homepage.dart';
import 'package:wallpaper_studio/pages/settings.dart';
import 'package:wallpaper_studio/widgets/set_wallapaper.dart';
import 'package:wallpaper_studio/widgets/nature_card.dart';
import 'package:wallpaper_studio/widgets/nav_button.dart';
import 'package:wallpaper_studio/widgets/nav_button_item.dart';

class WallpaperDetailsScreen extends StatefulWidget {
  const WallpaperDetailsScreen({super.key});

  @override
  State<WallpaperDetailsScreen> createState() => _WallpaperDetailsScreenState();
}

class _WallpaperDetailsScreenState extends State<WallpaperDetailsScreen> {
  final List<NatureCategory> categories = [
    NatureCategory(
      name: 'Nature 1',
      imageUrl: 'assets/nature1.png',
      isFavorite: true,
    ),
    NatureCategory(name: 'Nature 2', imageUrl: 'assets/nature2.png'),
    NatureCategory(name: 'Nature 3', imageUrl: 'assets/nature3.png'),
    NatureCategory(name: 'Nature 4', imageUrl: 'assets/nature4.png'),
    NatureCategory(name: 'Nature 5', imageUrl: 'assets/nature5.png'),
    NatureCategory(name: 'Nature 6', imageUrl: 'assets/nature6.png'),
  ];

  Wallpaper? selectedWallpaper;

  @override
  void initState() {
    super.initState();
    selectedWallpaper = Wallpaper(
      name: 'Nature 1',
      description:
          'Discover the pure beauty of "Natural Essence" - your gateway to authentic, nature-inspired experiences. Let this unique collection elevate your senses and connect you with the unrefined elegance of the natural world.',
      tags: ['Nature', 'Ambience', 'Flowers'],
      imageUrl: 'assets/nature1.png',
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.black54),
        ),
        SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.black54)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final Widget? mobileDrawer = screenWidth <= 700
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
                isBrowseActive: true,
                isFavouriteActive: false,
                isSettingsActive: false,
              ),
      ),

      body: screenWidth <= 700
          ? ListView(
              padding: const EdgeInsets.all(24.0),

              children: [
                TextButton(
                  clipBehavior: Clip.hardEdge,
                  
                  onPressed: () {
                    Navigator.pop(context);
                  },

                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back),
                      Text('Back to Categories'),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Nature',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.grid_view, color: Colors.orange),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.format_list_bulleted),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 24),

                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: screenWidth <= 700 ? 2 : 3,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: screenWidth <= 700 ? 2 / 3 : 0.8,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return NatureCategoryCard(
                      category: categories[index],
                      onTap: () {
                        setState(() {
                          selectedWallpaper = Wallpaper(
                            name: categories[index].name,
                            description:
                                'This is a beautiful ${categories[index].name} wallpaper. Discover its serene beauty.',
                            tags: ['Nature', 'Mountain', 'Forest'],
                            imageUrl: categories[index].imageUrl.replaceFirst(
                              '/300/200',
                              '/700/1200',
                            ),
                          );
                        });
                      },
                    );
                  },
                ),

                SizedBox(height: 24),

                Container(
                  color: Colors.grey.shade100,
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Preview',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 24),
                      if (selectedWallpaper != null) ...[
                        Text(
                          selectedWallpaper!.name,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 8),
                        Wrap(
                          spacing: 8.0,
                          runSpacing: 4.0,
                          children: selectedWallpaper!.tags
                              .map(
                                (tag) => Chip(
                                  label: Text(tag),
                                  backgroundColor: Colors.grey.shade300,
                                  labelStyle: TextStyle(color: Colors.black),
                                  side: BorderSide(color: Colors.black),
                                ),
                              )
                              .toList(),
                        ),
                        SizedBox(height: 16),
                        Text(
                          selectedWallpaper!.description,
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                        SizedBox(height: 24),
                        Row(
                          children: [
                            _buildActionButton(Icons.upload, 'Share'),
                            SizedBox(width: 16),
                            _buildActionButton(Icons.download, 'Download'),
                            SizedBox(width: 16),
                            _buildActionButton(Icons.settings, 'Settings'),
                          ],
                        ),
                        SizedBox(height: 24),
                        Center(
                          child: Container(
                            width: 180,
                            height: 380,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.2),
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Image.asset(
                                selectedWallpaper!.imageUrl,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Center(
                                      child: Icon(
                                        Icons.broken_image,
                                        color: Colors.white,
                                      ),
                                    ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () {
                                  showGeneralDialog(
                                    context: context,

                                    barrierLabel: 'Dismiss',

                                    transitionDuration: const Duration(
                                      milliseconds: 300,
                                    ),
                                    pageBuilder:
                                        (
                                          context,
                                          animation,
                                          secondaryAnimation,
                                        ) {
                                          return BackdropFilter(
                                            filter: ImageFilter.blur(
                                              sigmaX: 5.0,
                                              sigmaY: 5.0,
                                            ),
                                            child: Align(
                                              alignment: Alignment.center,

                                              child: SizedBox(
                                                width: 500,
                                                child: AlertDialog(
                                                  insetPadding: EdgeInsets.zero,
                                                  content:
                                                      WallpaperSetupPanel(),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                  );
                                },
                                icon: Icon(Icons.favorite_border),
                                label: Text('Save to Favorites'),
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.deepPurple,
                                  side: BorderSide(color: Colors.deepPurple),
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  showGeneralDialog(
                                    context: context,

                                    barrierLabel: 'Dismiss',

                                    transitionDuration: const Duration(
                                      milliseconds: 300,
                                    ),
                                    pageBuilder:
                                        (
                                          context,
                                          animation,
                                          secondaryAnimation,
                                        ) {
                                          return BackdropFilter(
                                            filter: ImageFilter.blur(
                                              sigmaX: 5.0,
                                              sigmaY: 5.0,
                                            ),
                                            child: Align(
                                              alignment: Alignment.centerRight,

                                              child: SizedBox(
                                                width: 500,
                                                child: AlertDialog(
                                                  insetPadding: EdgeInsets.zero,
                                                  content:
                                                      WallpaperSetupPanel(),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange,
                                  foregroundColor: Colors.white,
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text('Set to Wallpaper'),
                              ),
                            ),
                          ],
                        ),
                      ],
                      if (selectedWallpaper == null)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 48.0),
                          child: Center(
                            child: Text(
                              'Select a wallpaper to preview',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back),
                          label: Text('Back to Categories'),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.black,
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Nature',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.grid_view,
                                    color: Colors.orange,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.format_list_bulleted),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 24),

                        Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: screenWidth <= 700 ? 2 : 3,
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 16,
                                  childAspectRatio: screenWidth <= 700
                                      ? 2 / 3
                                      : 0.8,
                                ),
                            itemCount: categories.length,
                            itemBuilder: (context, index) {
                              return NatureCategoryCard(
                                category: categories[index],
                                onTap: () {
                                  setState(() {
                                    selectedWallpaper = Wallpaper(
                                      name: categories[index].name,
                                      description:
                                          'This is a beautiful ${categories[index].name} wallpaper. Discover its serene beauty.',
                                      tags: ['Nature', 'Mountain', 'Forest'],
                                      imageUrl: categories[index].imageUrl
                                          .replaceFirst(
                                            '/300/200',
                                            '/700/1200',
                                          ),
                                    );
                                  });
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.grey.shade100,
                    padding: const EdgeInsets.all(24.0),
                    child: ListView(
                      children: [
                        Text(
                          'Preview',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 24),
                        if (selectedWallpaper != null) ...[
                          Text(
                            selectedWallpaper!.name,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 8),

                          Wrap(
                            spacing: 8.0,
                            runSpacing: 4.0,
                            children: selectedWallpaper!.tags
                                .map(
                                  (tag) => Chip(
                                    label: Text(tag),
                                    backgroundColor: Colors.grey.shade300,
                                    labelStyle: TextStyle(color: Colors.black),
                                    side: BorderSide(color: Colors.black),
                                  ),
                                )
                                .toList(),
                          ),
                          SizedBox(height: 16),

                          Text(
                            selectedWallpaper!.description,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                          SizedBox(height: 24),

                          Row(
                            children: [
                              _buildActionButton(Icons.upload, 'Share'),
                              SizedBox(width: 16),
                              _buildActionButton(Icons.download, 'Download'),
                              SizedBox(width: 16),
                              _buildActionButton(Icons.settings, 'Settings'),
                            ],
                          ),
                          SizedBox(height: 24),

                          Center(
                            child: Container(
                              width: 180,
                              height: 380,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.2),
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.asset(
                                  selectedWallpaper!.imageUrl,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Center(
                                        child: Icon(
                                          Icons.broken_image,
                                          color: Colors.white,
                                        ),
                                      ),
                                ),
                              ),
                            ),
                          ),

                          Spacer(),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: OutlinedButton.icon(
                                  onPressed: () {
                                    showGeneralDialog(
                                      context: context,

                                      barrierLabel: 'Dismiss',

                                      transitionDuration: const Duration(
                                        milliseconds: 300,
                                      ),
                                      pageBuilder:
                                          (
                                            context,
                                            animation,
                                            secondaryAnimation,
                                          ) {
                                            return BackdropFilter(
                                              filter: ImageFilter.blur(
                                                sigmaX: 5.0,
                                                sigmaY: 5.0,
                                              ),
                                              child: Align(
                                                alignment:
                                                    Alignment.centerRight,

                                                child: SizedBox(
                                                  width: 500,
                                                  child: AlertDialog(
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    content:
                                                        WallpaperSetupPanel(),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                    );
                                  },
                                  icon: Icon(Icons.favorite_border),
                                  label: Text('Save to Favorites'),
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: Colors.deepPurple,
                                    side: BorderSide(color: Colors.deepPurple),
                                    padding: EdgeInsets.symmetric(vertical: 16),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    showGeneralDialog(
                                      context: context,

                                      barrierLabel: 'Dismiss',

                                      transitionDuration: const Duration(
                                        milliseconds: 300,
                                      ),
                                      pageBuilder:
                                          (
                                            context,
                                            animation,
                                            secondaryAnimation,
                                          ) {
                                            return BackdropFilter(
                                              filter: ImageFilter.blur(
                                                sigmaX: 5.0,
                                                sigmaY: 5.0,
                                              ),
                                              child: Align(
                                                alignment:
                                                    Alignment.centerRight,

                                                child: SizedBox(
                                                  width: 500,
                                                  child: AlertDialog(
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    content:
                                                        WallpaperSetupPanel(),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                    );
                                  },

                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.orange,
                                    foregroundColor: Colors.white,
                                    padding: EdgeInsets.symmetric(vertical: 16),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: Text('Set to Wallpaper'),
                                ),
                              ),
                            ],
                          ),
                        ],
                        if (selectedWallpaper == null)
                          Expanded(
                            child: Center(
                              child: Text(
                                'Select a wallpaper to preview',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
