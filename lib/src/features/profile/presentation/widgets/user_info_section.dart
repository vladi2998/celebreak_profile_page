// lib/src/features/profile/presentation/widgets/user_info_section.dart
import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserInfoSection extends StatelessWidget {
  const UserInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const double horizontalPaddingRatio = 0.9;
    const Map userInfoMockup = {
      'job': {'role': 'Event Planner', 'company': 'Celebreak'},
      'location': ['Buenos Aires', 'Franfurt', 'Madrid'],
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
        // 4. personal details section
        Container(
          width: screenWidth * horizontalPaddingRatio,
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: Column(
            children: [
              // work
              SizedBox(height: 20),
              Row(
                children: [
                  SvgPicture.asset('assets/images/svg/job.svg'),
                  SizedBox(width: 8),
                  Text(
                    userInfoMockup['job']['role'],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    ' at ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  Text(
                    userInfoMockup['job']['company'],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              // location
              SizedBox(height: 20),
              Row(
                children: [
                  SvgPicture.asset('assets/images/svg/location.svg'),
                  SizedBox(width: 8),
                  Text(
                    'Lived in ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  ...userInfoMockup['location'].map((location) {
                    return Text(
                      '$location, ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    );
                  }).toList(),
                ],
              ),
              // languages
              SizedBox(height: 20),
              Row(
                children: [
                  SvgPicture.asset('assets/images/svg/languages.svg'),
                  SizedBox(width: 8),
                  Text(
                    'Speaks ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  ...userInfoMockup['language'].map((language) {
                    return Text(
                      '$language, ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    );
                  }).toList(),
                ],
              ),
              // teams
              SizedBox(height: 20),
              Row(
                children: [
                  SvgPicture.asset('assets/images/svg/teams.svg'),
                  SizedBox(width: 8),
                  Text(
                    'Supports ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  ...userInfoMockup['teams'].map((team) {
                    return Text(
                      '$team, ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    );
                  }).toList(),
                ],
              ),
              // idols
              SizedBox(height: 20),
              Row(
                children: [
                  SvgPicture.asset('assets/images/svg/player_idols.svg'),
                  SizedBox(width: 8),
                  Text(
                    'Admires ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  ...userInfoMockup['idols'].map((idol) {
                    return Text(
                      '$idol, ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    );
                  }).toList(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
