import 'package:flutter/material.dart';
import 'package:time_manager/home_screen.dart';
import 'package:time_manager/local_storage.dart';
import 'package:time_manager/notifications_screen.dart';
import 'package:time_manager/personal_info_screen.dart';
import 'package:time_manager/settings_menu.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key, required this.widget});

  final HomeScreen widget;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            padding: EdgeInsetsGeometry.all(24),
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(username: widget.username),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.account_box),
            title: const Text('Personal Info'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      PersonalInfoScreen(username: widget.username),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsMenu(username: widget.username),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: const Text('Notifications'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationsScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: const Text('Sign Out '),
            onTap: () {
              signOut(context);
            },
          ),
        ],
      ),
    );
  }
}
