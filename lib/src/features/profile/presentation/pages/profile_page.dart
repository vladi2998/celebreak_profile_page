// lib/src/features/profile/presentation/pages/profile_page.dart
import 'package:celebreak_profile_page/src/features/profile/presentation/widgets/profile_header.dart';
import 'package:celebreak_profile_page/src/features/profile/presentation/widgets/user_info_section.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileHeader(key: Key('profile_header')),
            SizedBox(height: 24),
            // ---- Scrolleable part ----
            UserInfoSection(key: Key('user_info')),
            SizedBox(height: 24),
            // 3. InterestsSection
            SizedBox(height: 24),
            // 4. FootballSkills
            SizedBox(height: 24),
            // 5. UpcomingGames
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
