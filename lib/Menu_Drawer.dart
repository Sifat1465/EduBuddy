import 'package:flutter/material.dart';

// Pages
import 'package:flutter_application_1/pages/dailylearn.dart';
import 'package:flutter_application_1/pages/doubtsolving.dart';
import 'package:flutter_application_1/pages/routinemanagement.dart';
import 'package:flutter_application_1/pages/voting.dart';
import 'package:flutter_application_1/pages/notification.dart';
import 'package:flutter_application_1/pages/resources.dart';

// Settings / Logout
import 'package:flutter_application_1/AppSettings_LogoutPage.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  final List<Map<String, dynamic>> menuOptions = const [
    {
      'title': 'Daily Learn',
      'icon': Icons.school,
      'color': Colors.orange,
      'page': DailyLearnPage(),
    },
    {
      'title': 'Doubt Solving',
      'icon': Icons.question_answer,
      'color': Colors.green,
      'page': DoubtSolving(),
    },
    {
      'title': 'Routine Management',
      'icon': Icons.schedule,
      'color': Colors.purple,
      'page': RoutineManagement(),
    },
    {
      'title': 'Voting',
      'icon': Icons.how_to_vote,
      'color': Colors.red,
      'page': Voting(),
    },
    {
      'title': 'Notification',
      'icon': Icons.notifications,
      'color': Colors.blue,
      'page': NotificationPage(),
    },
    {
      'title': 'Resources',
      'icon': Icons.book,
      'color': Colors.teal,
      'page': Resources(),
    },
    {
      'title': 'Settings',
      'icon': Icons.settings,
      'color': Colors.grey,
      'page': AppSettingsPage(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // ---------- HEADER ----------
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.lightBlueAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Text(
                'Menu Options',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // ---------- MENU ITEMS ----------
          Expanded(
            child: ListView.builder(
              itemCount: menuOptions.length,
              itemBuilder: (context, index) {
                final option = menuOptions[index];

                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: option['color'],
                    child: Icon(option['icon'], color: Colors.white),
                  ),
                  title: Text(option['title']),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    Navigator.pop(context); // Close drawer

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => option['page']),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Voting {
  const Voting();
}

class NotificationPage {
  const NotificationPage();
}

class Resources {
  const Resources();
}

class RoutineManagement {
  const RoutineManagement();
}

class DoubtSolving {
  const DoubtSolving();
}
