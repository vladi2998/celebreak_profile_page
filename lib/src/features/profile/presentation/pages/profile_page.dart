// lib/src/features/profile/presentation/pages/profile_page.dart
import 'package:celebreak_profile_page/src/features/profile/presentation/widgets/profile_header.dart';
import 'package:celebreak_profile_page/src/features/profile/presentation/widgets/user_info_section.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    const double verticalSpace = 10;
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileHeader(key: Key('profile_header')),
            SizedBox(height: verticalSpace),
            // ---- Scrolleable part ----
            UserInfoSection(key: Key('user_info')),
            SizedBox(height: verticalSpace),
            // 3. InterestsSection
            SizedBox(height: verticalSpace),
            // 4. FootballSkills
            SizedBox(height: verticalSpace),
            // 5. UpcomingGames
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
