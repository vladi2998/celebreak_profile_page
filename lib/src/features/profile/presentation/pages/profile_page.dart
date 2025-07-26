// lib/src/features/profile/presentation/pages/profile_page.dart
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
            // 1. ProfileHeader
            SizedBox(height: 24),
            // 2. UserInfoSection
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
