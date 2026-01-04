import 'package:ai_search_app/widgets/search_bar_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchSection extends StatefulWidget {
  const SearchSection({super.key});

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  @override
  Widget build(BuildContext context) {
    return Center(
      // Centering is IMPORTANT for Web UI
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 900),
        child: Container(
          margin: const EdgeInsets.all(24.0),
          padding: const EdgeInsets.all(32.0),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey[900]!),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // -------------------------------
              // Title & Subtitle  (Perplexity‑style)
              // -------------------------------
              Text(
                'Ask anything',
                style: GoogleFonts.ibmPlexMono(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'AI‑powered answers with web search.',
                style: GoogleFonts.ibmPlexMono(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 24),

              // -------------------------------
              // Search Input Box (Perplexity‑like)
              // -------------------------------
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: Colors.grey[800]!, width: 1.4),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      cursorColor: Colors.white, // Important for Web
                      style: const TextStyle(color: Colors.white),
                      maxLines: null,
                      minLines: 1,
                      decoration: const InputDecoration(
                        hintText:
                            'Ask anything... (e.g. "Summarize the latest AI news")',
                        hintStyle: TextStyle(color: Colors.white54),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: const [
                        SearchBarButton(
                          icon: Icons.auto_awesome_outlined,
                          text: 'Focus',
                        ),
                        SizedBox(width: 10),
                        SearchBarButton(
                          icon: Icons.add_outlined,
                          text: 'Attach',
                        ),
                        Spacer(),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // -------------------------------
              // Submit button row (aligned right)
              // -------------------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 33, 215, 243),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      padding: const EdgeInsets.all(10),
                      icon: const Icon(
                        Icons.arrow_upward_rounded,
                        color: Colors.black,
                        size: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
