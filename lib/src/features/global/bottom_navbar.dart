import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomBottomNavBar({
    required this.selectedIndex,
    required this.onItemSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onItemSelected,
      backgroundColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color.fromRGBO(255, 185, 0, 1),
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: const TextStyle(fontSize: 12),
      items: [
        _buildNavItem(
          iconPath: 'assets/images/svg/mag_glass.svg',
          label: 'Explore',
          isSelected: selectedIndex == 0,
        ),
        _buildNavItem(
          iconPath: 'assets/images/svg/field.svg',
          label: 'Fields',
          isSelected: selectedIndex == 1,
        ),
        _buildNavItem(
          iconPath: 'assets/images/svg/message_globe.svg',
          label: 'Messages',
          isSelected: selectedIndex == 2,
        ),
        _buildNavItem(
          iconPath: 'assets/images/svg/profile.svg',
          label: 'Profile',
          isSelected: selectedIndex == 3,
        ),
      ],
    );
  }

  BottomNavigationBarItem _buildNavItem({
    required String iconPath,
    required String label,
    required bool isSelected,
  }) {
    final Color iconColor = isSelected
        ? const Color.fromRGBO(255, 185, 0, 1)
        : Colors.grey;

    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        iconPath,
        colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
        width: 24,
        height: 24,
      ),
      label: label,
    );
  }
}
