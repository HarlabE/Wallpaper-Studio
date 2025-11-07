import 'package:flutter/material.dart';

class NavButtonItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool active;

  const NavButtonItem({
    super.key,
    required this.icon,
    required this.label,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenWidth <= 700 ? 50 : null,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: active ? Colors.grey.shade200 : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: active ? Colors.grey.shade400 : Colors.transparent,
        ),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: active ? Colors.black87 : Colors.black54),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: active ? Colors.black87 : Colors.black54,
              fontSize: 14,
              fontWeight: active ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
