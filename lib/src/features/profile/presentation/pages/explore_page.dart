// lib/src/features/profile/presentation/pages/explore_page.dart
import 'package:celebreak_profile_page/src/features/profile/presentation/widgets/football_skills.dart';
import 'package:celebreak_profile_page/src/features/global/horizontal_separator.dart';
import 'package:celebreak_profile_page/src/features/profile/presentation/widgets/interests_section.dart';
import 'package:celebreak_profile_page/src/features/profile/presentation/widgets/profile_header.dart';
import 'package:celebreak_profile_page/src/features/profile/presentation/widgets/upcoming_games.dart';
import 'package:celebreak_profile_page/src/features/profile/presentation/widgets/user_info_section.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    const double verticalSpace = 10;
    final screenWidth = MediaQuery.of(context).size.width;
    final separatorWidth = screenWidth - 20;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileHeader(key: const Key('profile_header')),
            const SizedBox(height: verticalSpace),
            // ---- Scrolleable part ----
            const UserInfoSection(key: Key('user_info')),
            const SizedBox(height: verticalSpace),
            HorizontalSeparator(width: separatorWidth),
            // 3. InterestsSection
            const InterestsSection(),
            const SizedBox(height: verticalSpace),
            HorizontalSeparator(width: separatorWidth),
            // 4. FootballSkills
            FootballSkillsSection(),
            const SizedBox(height: verticalSpace),
            HorizontalSeparator(width: separatorWidth),
            // 5. UpcomingGames
            UpcomingGamesSection(),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
