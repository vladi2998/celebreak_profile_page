import 'package:celebreak_profile_page/src/features/global/progress_bar.dart';
import 'package:flutter/material.dart';

class FootballSkillsSection extends StatelessWidget {
  const FootballSkillsSection({super.key});

  // Mock data for football skills
  static const List<Map<String, dynamic>> footballSkills = [
    {'skill': 'Technical', 'level': 0.85}, // 85%
    {'skill': 'Fitness', 'level': 0.95}, // 95%
    {'skill': 'Tactical', 'level': 0.2}, // 20%
    {'skill': 'Shooting', 'level': 0.15}, // 15%
    {'skill': 'Passing', 'level': 0.60}, // 60%
    {'skill': 'Dribbling', 'level': 0.40}, // 40%
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const double horizontalContentRatio = 0.9;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * (1 - horizontalContentRatio) / 2,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Football Skills',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
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
          child: Column(
            children: footballSkills.map((skillData) {
              return Padding(
                padding: const EdgeInsets.only(
                  bottom: 15.0,
                ), // Space between each skill item
                child: ProgressBar(
                  skill: skillData['skill'] as String,
                  level: skillData['level'] as double,
                ),
              );
            }).toList(),
          ),
        ),

        const SizedBox(height: 15), // Spacing before bottom separator
        // Bottom Horizontal Separator
        _buildHorizontalSeparator(screenWidth),
      ],
    );
  }

  // Helper method for the horizontal separator
  Widget _buildHorizontalSeparator(double screenWidth) {
    return Container(
      width: screenWidth * 0.9, // Match the content width
      height: 1.0, // Thickness of the line
      color: const Color.fromRGBO(21, 21, 21, 1), // Dark gray/black color
    );
  }
}
