import 'package:ai_search_app/widgets/side_button.dart';
import 'package:flutter/material.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  bool isCollapsed = true;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: isCollapsed ? 64 : 220,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border(
          right: BorderSide(color: Colors.grey[900]!, width: 1),
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment:
              isCollapsed ? CrossAxisAlignment.center : CrossAxisAlignment.start,
          children: [
            // Top app/brand area
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isCollapsed ? 0 : 12,
                vertical: 8,
              ),
              child: Row(
                mainAxisAlignment: isCollapsed
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.bolt, color: Colors.white, size: 22),
                      if (!isCollapsed) ...[
                        const SizedBox(width: 8),
                        const Text(
                          'AI Search',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ],
                  ),
                  if (!isCollapsed)
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(
                        Icons.chevron_left,
                        color: Colors.white70,
                        size: 22,
                      ),
                      onPressed: () {
                        setState(() {
                          isCollapsed = true;
                        });
                      },
                    ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // Primary navigation (similar to Perplexity: Home, New Chat, Search)
            SideButton(
              isCollapsed: isCollapsed,
              icon: Icons.auto_awesome_mosaic,
              text: 'Home',
              isActive: selectedIndex == 0,
              onTap: () {
                setState(() {
                  selectedIndex = 0;
                });
              },
            ),
            SideButton(
              isCollapsed: isCollapsed,
              icon: Icons.add,
              text: 'New Chat',
              isActive: selectedIndex == 1,
              onTap: () {
                setState(() {
                  selectedIndex = 1;
                });
              },
            ),
            SideButton(
              isCollapsed: isCollapsed,
              icon: Icons.search,
              text: 'Search',
              isActive: selectedIndex == 2,
              onTap: () {
                setState(() {
                  selectedIndex = 2;
                });
              },
            ),

            const SizedBox(height: 8),

            // Secondary items
            SideButton(
              isCollapsed: isCollapsed,
              icon: Icons.auto_awesome,
              text: 'AI Assistant',
              isActive: selectedIndex == 3,
              onTap: () {
                setState(() {
                  selectedIndex = 3;
                });
              },
            ),
            SideButton(
              isCollapsed: isCollapsed,
              icon: Icons.cloud_outlined,
              text: 'Cloud Storage',
              isActive: selectedIndex == 4,
              onTap: () {
                setState(() {
                  selectedIndex = 4;
                });
              },
            ),
            

            const Spacer(),

            // Collapse/expand control at bottom (Perplexity-like chevron)
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: IconButton(
                icon: Icon(
                  isCollapsed
                      ? Icons.chevron_right
                      : Icons.chevron_left,
                  color: Colors.white70,
                  size: 26,
                ),
                onPressed: () {
                  setState(() {
                    isCollapsed = !isCollapsed;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
