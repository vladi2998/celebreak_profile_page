// lib/src/features/profile/presentation/widgets/user_info_section.dart
import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class UserInfoSection extends StatelessWidget {
  const UserInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const double horizontalPaddingRatio = 0.9;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // 1. Message Button
        SizedBox(
          width: screenWidth * horizontalPaddingRatio,
          height: 44,
          child: ElevatedButton.icon(
            onPressed: () {
              print('Message button pressed!');
            },
            icon: const Icon(EvaIcons.messageCircleOutline),
            label: const Text(
              'Message',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(255, 185, 0, 1),
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
            ),
          ),
        ),
        const SizedBox(height: 20),
        // 2. Bio Text
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * (1 - horizontalPaddingRatio) / 2,
          ),
          child: const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Living life one goal at a time. Always ready for a match!',
              style: TextStyle(
                color: Color.fromRGBO(174, 174, 178, 1),
                fontSize: 17,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        const SizedBox(height: 20),
        // 3. "kudos received" Section
        Container(
          width: screenWidth * horizontalPaddingRatio,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(21, 21, 21, 1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('🧤'),
              const Text('🤝'),
              const Text(
                '7 kudos received',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
