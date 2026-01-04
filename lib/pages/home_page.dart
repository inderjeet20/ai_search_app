import 'package:ai_search_app/widgets/search_section.dart';
import 'package:flutter/material.dart';
import '../widgets/side_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Web needs clear background
      body: Row(
        children: [
          // -------------------------------
          // Sidebar (fixed width widget)
          // -------------------------------
          const SideBar(),

          // -------------------------------
          // MAIN CONTENT AREA (Perplexity-like layout)
          // Expanded is REQUIRED inside Row
          // otherwise content won't appear on Web
          // -------------------------------
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // -------------------------------
                // Top app bar (right-aligned actions, Perplexity-inspired)
                // -------------------------------
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        tooltip: 'Settings',
                        icon: const Icon(
                          Icons.settings_outlined,
                          color: Colors.white70,
                          size: 20,
                        ),
                        onPressed: () {},
                      ),
                      const SizedBox(width: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(999),
                          border: Border.all(color: Colors.grey[800]!),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(
                              Icons.person_outline,
                              color: Colors.white70,
                              size: 18,
                            ),
                            SizedBox(width: 6),
                            Text(
                              'Sign in',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // -------------------------------
                // Centered search section (scrollable for smaller screens)
                // -------------------------------
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 8,
                      ),
                      child: const SearchSection(),
                    ),
                  ),
                ),

                // -------------------------------
                // Footer (subtle, centered, Perplexity-like)
                // -------------------------------
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border(
                      top: BorderSide(color: Colors.grey[900]!),
                    ),
                  ),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 18,
                    runSpacing: 8,
                    children: const [
                      Text(
                        '© 2026 AI Search App',
                        style: TextStyle(color: Colors.grey, fontSize: 11),
                      ),
                      Text(
                        'Privacy Policy',
                        style: TextStyle(color: Colors.grey, fontSize: 11),
                      ),
                      Text(
                        'Terms of Service',
                        style: TextStyle(color: Colors.grey, fontSize: 11),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
