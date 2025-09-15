import 'dart:convert';
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool notificationsEnabled = false;
  List<String> selectedActivities = [];
  List<String> selectedTimes = [];
  Map<String, String> allActivitiesMap = {};

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      notificationsEnabled = prefs.getBool('notificationsEnabled') ?? false;
      allActivitiesMap = Map<String, String>.from(
        jsonDecode(prefs.getString('selectedActivitiesMap') ?? '{}'),
      );
      selectedActivities = prefs.getStringList('notificationActivities') ?? [];
      selectedTimes = prefs.getStringList('notificationTimes') ?? [];
    });
  }

  Future<void> _saveNotificationSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notificationsEnabled', notificationsEnabled);
    await prefs.setStringList('notificationActivities', selectedActivities);
    await prefs.setStringList('notificationTimes', selectedTimes);
  }

  void _sendTestNotification() {
    if (html.Notification.permission != "granted") {
      html.Notification.requestPermission().then((permission) {
        if (permission == 'granted') {
          html.Notification(
            "Activity Reminder",
            body: "It's time to work on your activity!",
          );
          print('Notification permission granted. Notification sent.');
        } else {
          print('Notification permission denied.');
        }
      });
    } else {
      html.Notification(
        "Activity Reminder",
        body: "It's time to work on your activity!",
      );
      print('Notification sent directly.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        automaticallyImplyLeading: true,
        title: Text("Notifications"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SwitchListTile(
              title: Text('Enable Notifications'),
              value: notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  notificationsEnabled = value;
                });
                _saveNotificationSettings();
              },
            ),
            Divider(),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                border: Border.all(color: Colors.grey),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Icon(Icons.attach_file),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Select Tasks for Notification',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: ['High Priority', 'Medium Priority', 'Low Priority']
                    .map((entry) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FilterChip(
                          label: Text(entry),
                          selected: selectedActivities.contains(entry),
                          backgroundColor: entry == "High Priority"
                              ? Colors.lightBlue.shade100
                              : (entry == "Medium Priority"
                                    ? Colors.yellow.shade100
                                    : Colors.grey.shade300),
                          selectedColor: entry == "High Priority"
                              ? Colors.lightBlue.shade100
                              : (entry == "Medium Priority"
                                    ? Colors.yellow.shade100
                                    : Colors.grey.shade300),
                          onSelected: (bool selected) {
                            setState(() {
                              if (selected) {
                                selectedActivities.add(entry);
                              } else {
                                selectedActivities.remove(entry);
                              }
                            });
                            _saveNotificationSettings();
                          },
                        ),
                      );
                    })
                    .toList(),
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                border: Border.all(color: Colors.grey),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Icon(Icons.alarm),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Select Times for Notification',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: ['Morning', 'Afternoon', 'Evening', 'Night'].map((
                  time,
                ) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FilterChip(
                      label: Text(time),
                      backgroundColor: Colors.grey.shade300,
                      selected: selectedTimes.contains(time),
                      onSelected: (bool selected) {
                        setState(() {
                          if (selected) {
                            selectedTimes.add(time);
                          } else {
                            selectedTimes.remove(time);
                          }
                        });
                        _saveNotificationSettings();
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Use the _sendTestNotification method to trigger the notification
                _sendTestNotification();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade700,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: Text('Send Test Notification'),
            ),
          ],
        ),
      ),
    );
  }
}
