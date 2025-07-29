// lib/src/features/profile/presentation/widgets/profile_header.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final double profileBackgroundHeight = 280;
    final double bottom = profileBackgroundHeight / 4;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        // 1. Background image
        Container(
          margin: EdgeInsets.only(bottom: bottom),
          child: Image.asset(
            'assets/images/png/user_profile_bg_img.png',
            width: double.infinity,
            height: profileBackgroundHeight,
            fit: BoxFit.cover,
          ),
        ),
        // 2. Dark Overlay
        // Container(height: 300, color: Colors.orangeAccent.withOpacity(0.5)),
        // 3. Back and Menu Icons
        Positioned(
          top: 45,
          left: 5,
          right: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back_ios),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
            ],
          ),
        ),
        // 4. Content positioned at the bottom of the Stack
        Positioned(
          top: 90,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 4),
                ),
                child: const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(
                    'assets/images/png/user_profile_img.png',
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Alex Johnson',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              const Text(
                '@alexjohnson',
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(174, 174, 178, 1),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/svg/flag_arg.svg',
                    width: 20,
                    height: 12.5,
                    semanticsLabel: 'Argentinas flag icon',
                  ),
                  Text(' 24 yo', style: TextStyle(fontSize: 16)),
                  HorizontalDivider(),
                  SvgPicture.asset(
                    'assets/images/svg/ball.svg',
                    width: 20,
                    height: 20,
                    semanticsLabel: 'Foot ball icon',
                  ),
                  Text('DEF', style: TextStyle(fontSize: 16)),
                  HorizontalDivider(),
                  Text(
                    '241',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(' games', style: TextStyle(fontSize: 16)),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }
}

class HorizontalDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 16),
        Text('|', style: TextStyle(color: Color.fromRGBO(48, 48, 48, 1))),
        SizedBox(width: 16),
      ],
    );
  }
}
