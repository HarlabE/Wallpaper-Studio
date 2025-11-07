import 'package:flutter/material.dart';
import 'package:wallpaper_studio/pages/browsepage.dart';
import 'package:wallpaper_studio/pages/favouritepage.dart';
import 'package:wallpaper_studio/pages/homepage.dart';
import 'package:wallpaper_studio/widgets/nav_button.dart';
import 'package:wallpaper_studio/widgets/nav_item.dart';
// import 'package:wallpaper_studio/widgets/nav_button_Item.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _selectedQuality = 'High (Best Quality)';
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
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
                ),
                SizedBox(height: 20),
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
                    active: false,
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
                isFavouriteActive: false,
                isSettingsActive: true,
              ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 24),

                  Card(
                    elevation: 0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),

                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          bool isWide = constraints.maxWidth > 900;
                          if (isWide) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: _buildSettingsColumn(),
                                ),
                                const SizedBox(width: 32),
                                Expanded(flex: 1, child: _buildDeviceColumn()),
                              ],
                            );
                          } else {
                            return Column(
                              children: [
                                _buildSettingsColumn(),
                                const SizedBox(height: 48),
                                _buildDeviceColumn(),
                              ],
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFFF9A825), Color(0xFFE91E63)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ).createShader(bounds),
          child: const Text(
            'Settings',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Customize your Wallpaper Studio experience',
          style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
        ),
      ],
    );
  }

  Widget _buildSettingsColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Wallpaper Setup',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Configure your wallpaper settings and enable auto-rotation',
          style: TextStyle(fontSize: 15, color: Colors.grey.shade600),
        ),
        const SizedBox(height: 32),

        const Text(
          'Image Quality',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: _selectedQuality,
          items:
              [
                    'High (Best Quality)',
                    'Medium (Recommended)',
                    'Low (Data Saver)',
                  ]
                  .map(
                    (label) =>
                        DropdownMenuItem(value: label, child: Text(label)),
                  )
                  .toList(),
          onChanged: (value) {
            if (value != null) {
              setState(() {
                _selectedQuality = value;
              });
            }
          },
        ),
        const SizedBox(height: 24),

        ListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text(
            'Notification',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          subtitle: Text(
            'Get notified about new wallpapers and updates',
            style: TextStyle(color: Colors.grey.shade600),
          ),
          trailing: Switch(
            value: _notificationsEnabled,
            onChanged: (value) {
              setState(() {
                _notificationsEnabled = value;
              });
            },
            activeColor: Colors.orange.shade700,
          ),
        ),
        const SizedBox(height: 32),
        const Divider(),
        const SizedBox(height: 24),

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            OutlinedButton(onPressed: () {}, child: const Text('Cancel')),
            const SizedBox(width: 16),
            _buildGradientButton(text: 'Save Settings', onPressed: () {}),
          ],
        ),
      ],
    );
  }

  Widget _buildGradientButton({
    required String text,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFF9A825), Color(0xFFE97B0C)], // Orange gradient
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildDeviceColumn() {
    return Container(
      padding: const EdgeInsets.all(16),
      alignment: Alignment.center,
      child: Container(
        width: 280,
        height: 560,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300, width: 2),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Column(
            children: [
              Container(
                width: 100,
                height: 24,
                margin: const EdgeInsets.only(top: 12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(12),
                  ),
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: Colors.green.shade700,
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Connected to device',
                      style: TextStyle(
                        color: Colors.green.shade900,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              TextButton(
                onPressed: () {},
                child: const Text('Click to disconnect'),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
