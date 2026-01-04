import 'package:flutter/material.dart';

/// A navigation button used in the left sidebar.
///
/// Designed to feel similar to Perplexity's sidebar items:
/// - Compact height
/// - Full-width tappable area
/// - Subtle pill highlight when active
class SideButton extends StatelessWidget {
  final bool isCollapsed;
  final IconData icon;
  final String text;
  final bool isActive;
  final VoidCallback? onTap;

  const SideButton({
    super.key,
    required this.isCollapsed,
    required this.icon,
    required this.text,
    this.isActive = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color iconColor = isActive ? Colors.white : Colors.white70;
    final Color textColor = isActive ? Colors.white : Colors.white70;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: InkWell
        (
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: isCollapsed ? 8 : 12,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: isActive ? Colors.grey[850] : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment:
                isCollapsed ? MainAxisAlignment.center : MainAxisAlignment.start,
            children: [
              Icon(icon, color: iconColor, size: 22),
              if (!isCollapsed) ...[
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    text,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
