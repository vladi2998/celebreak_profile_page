// lib/src/features/profile/presentation/widgets/upcoming_games_section.dart
import 'package:celebreak_profile_page/src/features/global/horizontal_separator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UpcomingGamesSection extends StatelessWidget {
  const UpcomingGamesSection({super.key});

  // Mock data for upcoming games
  static final List<Map<String, dynamic>> upcomingGamesData = [
    {
      'date': DateTime.now(),
      'games': [
        {
          'hour': '10:00 AM',
          'location': 'Barceloneta',
          'modality': '8v8',
          'level': 'Advanced',
          'isCompleted': true,
        },
        {
          'hour': '11:00 PM',
          'location': 'Barceloneta',
          'modality': '5v5',
          'level': 'Beginner',
          'isCompleted': true,
        },
        {
          'hour': '03:00 PM',
          'location': 'Gracia Park',
          'modality': '7v7',
          'level': 'Intermediate',
          'isCompleted': false,
        },
      ],
    },
    {
      'date': DateTime.now().add(const Duration(days: 2)),
      'games': [
        {
          'hour': '09:00 AM',
          'location': 'Diagonal Mar',
          'modality': '6v6',
          'level': 'Advanced',
          'isCompleted': false,
        },
        {
          'hour': '06:30 PM',
          'location': 'Montjuic Field',
          'modality': '8v8',
          'level': 'Intermediate',
          'isCompleted': true,
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const double horizontalContentRatio = 0.9;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * (1 - horizontalContentRatio) / 2,
          ),
          child: const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Upcoming pick-up games',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        const SizedBox(height: 20),
        // List of Game Dates and Items
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: upcomingGamesData.map((dateGroup) {
            final date = dateGroup['date'] as DateTime;
            final games = dateGroup['games'] as List<Map<String, dynamic>>;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * (1 - horizontalContentRatio) / 2,
                  ),
                  child: Text(
                    _formatDate(date),
                    style: const TextStyle(
                      color: Color.fromRGBO(174, 174, 178, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ...games.map((gameData) {
                  return Column(
                    children: [
                      SizedBox(height: 8),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal:
                              screenWidth * (1 - horizontalContentRatio) / 2,
                        ),
                        child: _GameItem(
                          hour: gameData['hour'] as String,
                          location: gameData['location'] as String,
                          modality: gameData['modality'] as String,
                          level: gameData['level'] as String,
                          isCompleted: gameData['isCompleted'] as bool,
                        ),
                      ),
                      SizedBox(height: 8),
                      if (gameData != games.last ||
                          dateGroup != upcomingGamesData.last)
                        HorizontalSeparator(width: screenWidth),
                      const SizedBox(height: 10),
                    ],
                  );
                }).toList(),
                const SizedBox(height: 10),
              ],
            );
          }).toList(),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  // Helper to format date based on whether it's today
  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final gameDate = DateTime(date.year, date.month, date.day);

    if (gameDate == today) {
      return 'Today, ${DateFormat('EEE dd MMMM, yyyy').format(date)}'; // "Today, Tue 17 January, 2023"
    } else {
      return DateFormat('EEE dd MMMM, yyyy').format(date);
    }
  }
}

// -------------------------------------------------------------------------- //
// _GameItem (for individual game entries)
// -------------------------------------------------------------------------- //
class _GameItem extends StatelessWidget {
  final String hour;
  final String location;
  final String modality;
  final String level;
  final bool isCompleted; // True if the game is full

  const _GameItem({
    required this.hour,
    required this.location,
    required this.modality,
    required this.level,
    required this.isCompleted,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                hour.split(' ')[0],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                hour.split(' ')[1],
                style: const TextStyle(
                  color: Color.fromRGBO(174, 174, 178, 1),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                location,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(
                    Icons.people_alt_outlined,
                    color: Colors.grey,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    modality,
                    style: const TextStyle(
                      color: Color.fromRGBO(174, 174, 178, 1),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Icon(Icons.bar_chart, color: Colors.grey, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    level,
                    style: const TextStyle(
                      color: Color.fromRGBO(174, 174, 178, 1),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // Status (Full / Arrow) (right side)
        SizedBox(
          width: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (isCompleted)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.red, width: 1.5),
                  ),
                  child: const Text(
                    'Full',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              else
                // match is not full widget
                Container(),

              const SizedBox(width: 8),
              const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
            ],
          ),
        ),
      ],
    );
  }
}
