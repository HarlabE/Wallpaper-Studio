import 'dart:ui';
import 'package:flutter/material.dart';

enum DisplayMode { fit, fill, stretch, tile }

class WallpaperSetupPanel extends StatefulWidget {
  const WallpaperSetupPanel({super.key});

  @override
  State<WallpaperSetupPanel> createState() => _WallpaperSetupPanelState();
}

class _WallpaperSetupPanelState extends State<WallpaperSetupPanel> {
  DisplayMode _displayMode = DisplayMode.fill;
  bool _autoRotation = true;
  bool _lockWallpaper = true;
  bool _syncAcrossDevices = false;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      child: Container(
        width: 600,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.9),
          border: Border(
            left: BorderSide(color: Colors.grey.shade300, width: 1.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 16.0,
                ),
                children: [
                  _buildActivateSection(context),
                  Divider(height: 40, color: Colors.grey.shade300),
                  _buildDisplayModeSection(),
                  Divider(height: 40, color: Colors.grey.shade300),
                  _buildAutoRotationSection(),
                  Divider(height: 40, color: Colors.grey.shade300),
                  _buildAdvancedSettingsSection(),
                  SizedBox(height: 24),
                ],
              ),
            ),
            _buildFooterButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: screenWidth <= 700
          ? const EdgeInsets.fromLTRB(12, 15, 12, 8)
          : const EdgeInsets.fromLTRB(24, 32, 24, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Wallpaper Setup',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Configure your wallpaper settings and enable auto-rotation',
            style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
          ),
        ],
      ),
    );
  }

  Widget _buildActivateSection(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Activate Wallpaper',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12),
        screenWidth <= 700
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Set the selected wallpaper as your desktop background',
                    style: TextStyle(color: Colors.grey.shade700, fontSize: 14),
                    maxLines: 2,
                  ),
                  SizedBox(height: 20),
                  Chip(
                    label: Text(
                      'Activated',
                      style: TextStyle(color: Colors.green.shade900),
                    ),
                    labelPadding: EdgeInsets.symmetric(horizontal: 8.0),
                    avatar: Icon(
                      Icons.check_circle,
                      color: Colors.green.shade900,
                      size: 18,
                    ),
                    backgroundColor: Colors.green.shade100,
                    side: BorderSide.none,
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Set the selected wallpaper as your\ndesktop background',
                    style: TextStyle(color: Colors.grey.shade700, fontSize: 14),
                    maxLines: 2,
                  ),
                  Chip(
                    label: Text(
                      'Activated',
                      style: TextStyle(color: Colors.green.shade900),
                    ),
                    labelPadding: EdgeInsets.symmetric(horizontal: 8.0),
                    avatar: Icon(
                      Icons.check_circle,
                      color: Colors.green.shade900,
                      size: 18,
                    ),
                    backgroundColor: Colors.green.shade100,
                    side: BorderSide.none,
                  ),
                ],
              ),
      ],
    );
  }

  Widget _buildDisplayModeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Display mode',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        _buildRadioTile(
          title: 'Fit',
          subtitle: 'Scale to fit without cropping',
          value: DisplayMode.fit,
        ),
        _buildRadioTile(
          title: 'Fill',
          subtitle: 'Scale to fill the entire screen',
          value: DisplayMode.fill,
        ),
        _buildRadioTile(
          title: 'Stretch',
          subtitle: 'Stretch to fill the screen',
          value: DisplayMode.stretch,
        ),
        _buildRadioTile(
          title: 'Tile',
          subtitle: 'Repeat the image to fill the screen',
          value: DisplayMode.tile,
        ),
      ],
    );
  }

  Widget _buildRadioTile({
    required String title,
    required String subtitle,
    required DisplayMode value,
  }) {
    return RadioListTile<DisplayMode>(
      title: Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
      subtitle: Text(subtitle, style: TextStyle(color: Colors.grey.shade700)),
      value: value,
      groupValue: _displayMode,
      onChanged: (newValue) => setState(() => _displayMode = newValue!),
      activeColor: Color(0xffFBB03B),
      contentPadding: EdgeInsets.zero,
    );
  }

  Widget _buildAutoRotationSection() {
    return SwitchListTile(
      title: Text(
        'Auto-Rotation',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        'Automatically change your wallpaper at regular intervals',
        style: TextStyle(color: Colors.grey.shade700),
      ),
      value: _autoRotation,
      onChanged: (value) => setState(() => _autoRotation = value),
      activeColor: Colors.white,
      activeTrackColor: Color(0xffFBB03B),
      contentPadding: EdgeInsets.zero,
    );
  }

  Widget _buildAdvancedSettingsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Advanced Settings',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        CheckboxListTile(
          title: Text(
            'Lock Wallpaper',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            'Prevent accidental changes',
            style: TextStyle(color: Colors.grey.shade700),
          ),
          value: _lockWallpaper,
          onChanged: (value) => setState(() => _lockWallpaper = value!),
          activeColor: Colors.orange.shade700,
          controlAffinity: ListTileControlAffinity.leading,
          contentPadding: EdgeInsets.zero,
        ),
        CheckboxListTile(
          title: Text(
            'Sync Across Devices',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            'Keep wallpaper consistent on all devices',
            style: TextStyle(color: Colors.grey.shade700),
          ),
          value: _syncAcrossDevices,
          onChanged: (value) => setState(() => _syncAcrossDevices = value!),
          activeColor: Colors.orange.shade700,
          controlAffinity: ListTileControlAffinity.leading,
          contentPadding: EdgeInsets.zero,
        ),
      ],
    );
  }

  Widget _buildFooterButtons(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey.shade300, width: 1.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.grey.shade700, fontSize: 16),
            ),
          ),
          SizedBox(width: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },

            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange.shade700,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text('Save Settings', style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
