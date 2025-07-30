import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({required this.skill, required this.level, super.key});

  final String skill;
  final double level;
  @override
  Widget build(BuildContext context) {
    // Ensure level is clamped between 0.0 and 1
    final clampedLevel = level.clamp(0.0, 1);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              skill,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "${(clampedLevel * 5).round()}/5",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Stack(
          children: [
            // Background of the progress bar
            Container(
              height: 8.0,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(50, 50, 50, 1),
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  height: 8.0,
                  width: constraints.maxWidth * clampedLevel,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 185, 0, 1),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
