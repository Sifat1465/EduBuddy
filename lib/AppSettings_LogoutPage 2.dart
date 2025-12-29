/* ===================== SETTINGS PAGE (+ LOGOUT) ===================== */

import 'package:flutter/material.dart';
import 'package:flutter_application_1/login_registrationPage.dart';

class AppSettingsPage extends StatefulWidget {
  const AppSettingsPage({super.key});

  @override
  _AppSettingsPageState createState() => _AppSettingsPageState();
}

class _AppSettingsPageState extends State<AppSettingsPage> {
  bool notificationsEnabled = true;
  bool darkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('App Settings')),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('Enable Notifications'),
            value: notificationsEnabled,
            onChanged: (v) => setState(() => notificationsEnabled = v),
          ),
          SwitchListTile(
            title: Text('Dark Mode'),
            value: darkModeEnabled,
            onChanged: (v) => setState(() => darkModeEnabled = v),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.red),
            title: Text("Logout"),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => LoginPage()),
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
