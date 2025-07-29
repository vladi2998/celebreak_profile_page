// lib/src/features/profile/presentation/widgets/interests_section.dart
import 'package:flutter/material.dart';

class InterestsSection extends StatelessWidget {
  const InterestsSection({super.key});

  // Mock data for interests
  static const List<Map<String, String>> interests = [
    {'emoji': '🎮', 'name': 'Gaming'},
    {'emoji': '✈️', 'name': 'Traveling'},
    {'emoji': '🎧', 'name': 'Music'},
    {'emoji': '📚', 'name': 'Reading'},
    {'emoji': '🍳', 'name': 'Cooking'},
    {'emoji': '🏋️', 'name': 'Fitness'},
    {'emoji': '🎥', 'name': 'Movies'},
    {'emoji': '⚽', 'name': 'Football'},
    {'emoji': '🎾', 'name': 'Tennis'},
    {'emoji': '🎨', 'name': 'Art'},
    {'emoji': '🚶', 'name': 'Hiking'},
    {'emoji': '💻', 'name': 'Coding'},
    {'emoji': '🎤', 'name': 'Karaoke'},
    {'emoji': '🍕', 'name': 'Foodie'},
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const double horizontalContentRatio = 0.9;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildHorizontalSeparator(screenWidth),
        const SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * (1 - horizontalContentRatio) / 2,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Interested in',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('See all interests tapped!');
                },
                child: const Text(
                  'See more',
                  style: TextStyle(
                    color: Color.fromRGBO(255, 185, 0, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * (1 - horizontalContentRatio) / 2,
          ),
          child: Wrap(
            spacing: 5.0,
            runSpacing: 5.0,
            children: interests.map((interest) {
              return _InterestBadge(
                emoji: interest['emoji']!,
                name: interest['name']!,
              );
            }).toList(),
          ),
        ),

        const SizedBox(height: 30), // Spacing before bottom separator
        // Bottom Horizontal Separator
        _buildHorizontalSeparator(screenWidth),
      ],
    );
  }

  // Helper method for the horizontal separator
  Widget _buildHorizontalSeparator(double screenWidth) {
    return Container(
      width: screenWidth * 0.9, // Match the content width
      height: 1.0,
      color: const Color.fromRGBO(48, 48, 48, 1),
    );
  }
}

// -------------------------------------------------------------------------- //
// Private Widget: _InterestBadge (for individual interest items)
// -------------------------------------------------------------------------- //
class _InterestBadge extends StatelessWidget {
  final String emoji;
  final String name;

  const _InterestBadge({required this.emoji, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey, width: 0.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 12)),
          const SizedBox(width: 8),
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
