// lib/src/features/profile/presentation/widgets/user_info_section.dart
import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserInfoSection extends StatelessWidget {
  const UserInfoSection({super.key});

  // Helper method to create a single info line
  Widget _buildInfoLine({
    required String iconPath,
    required String prefixText,
    required List<String> items,
    required BuildContext context, // to access screenWidth
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    const double horizontalContentWidth = 0.9;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * (1 - horizontalContentWidth) / 2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(iconPath, width: 24, height: 24),
              const SizedBox(width: 8),
              Text(
                prefixText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32.0),
            child: Wrap(
              spacing: 4.0,
              runSpacing: 4.0,
              children: items.map((item) {
                return Text(
                  item + (item == items.last ? '' : ','),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method for the job line, which is a bit different
  Widget _buildJobLine({
    required String iconPath,
    required String role,
    required String company,
    required BuildContext context,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    const double horizontalContentWidth = 0.9;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * (1 - horizontalContentWidth) / 2,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(iconPath, width: 24, height: 24),
          const SizedBox(width: 8),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.white, fontSize: 17),
                children: [
                  TextSpan(
                    text: role,
                    style: const TextStyle(fontWeight: FontWeight.w400),
                  ),
                  const TextSpan(
                    text: ' at ',
                    style: TextStyle(fontWeight: FontWeight.w100),
                  ),
                  TextSpan(
                    text: company,
                    style: const TextStyle(fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const double horizontalPaddingRatio = 0.9;
    const Map<String, dynamic> userInfoMockup = {
      'job': {'role': 'Event Planner', 'company': 'Celebreak'},
      'location': ['Buenos Aires', 'Frankfurt', 'Madrid', 'Barcelona'],
      'language': ['English', 'Spanish', 'Catalan'],
      'teams': ['Boca Juniors', 'FC Barcelona'],
      'idols': ['Patrick Viera', 'Sergio Busquets', 'Lionel Messi'],
    };

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
        const SizedBox(height: 25),
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
        const SizedBox(height: 25),
        // 3. "kudos received" Section
        Container(
          width: screenWidth * horizontalPaddingRatio,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 17),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(21, 21, 21, 1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 12,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromRGBO(48, 48, 48, 1),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(16),
                        color: const Color.fromRGBO(21, 21, 21, 1),
                      ),
                      child: const Text('🤝', style: TextStyle(fontSize: 14)),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromRGBO(48, 48, 48, 1),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(16),
                      color: const Color.fromRGBO(21, 21, 21, 1),
                    ),
                    child: const Text('🧤', style: TextStyle(fontSize: 14)),
                  ),
                ],
              ),
              const SizedBox(width: 24),
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

        // 4. Personal details section
        const SizedBox(height: 30),

        _buildJobLine(
          iconPath: 'assets/images/svg/job.svg',
          role: userInfoMockup['job']['role'],
          company: userInfoMockup['job']['company'],
          context: context,
        ),
        const SizedBox(height: 20),

        _buildInfoLine(
          iconPath: 'assets/images/svg/location.svg',
          prefixText: 'Lived in ',
          items: userInfoMockup['location'] as List<String>,
          context: context,
        ),
        const SizedBox(height: 20),

        _buildInfoLine(
          iconPath: 'assets/images/svg/languages.svg',
          prefixText: 'Speaks ',
          items: userInfoMockup['language'] as List<String>,
          context: context,
        ),
        const SizedBox(height: 20),

        _buildInfoLine(
          iconPath: 'assets/images/svg/teams.svg',
          prefixText: 'Supports ',
          items: userInfoMockup['teams'] as List<String>,
          context: context,
        ),
        const SizedBox(height: 20),

        _buildInfoLine(
          iconPath: 'assets/images/svg/player_idols.svg',
          prefixText: 'Admires ',
          items: userInfoMockup['idols'] as List<String>,
          context: context,
        ),
        const SizedBox(height: 30), // Spacing after the last item
      ],
    );
  }
}
