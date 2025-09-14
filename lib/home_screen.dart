import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:time_manager/add_schedule_dialog.dart';
import 'package:time_manager/detail_screen.dart';
import 'package:time_manager/login_screen.dart';
import 'package:time_manager/notifications_screen.dart';
import 'package:time_manager/profile_screen.dart';
import 'package:time_manager/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  final String username;
  const HomeScreen({super.key, required this.username});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime _selectedDate = DateTime.now();

  String formatDate(DateTime date) {
    final formattedDate = DateFormat('MMM d, yyyy').format(date);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.alarm, color: Colors.red.shade600, size: 40),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const AddScheduleDialog();
                },
              );
            },
            icon: Icon(Icons.settings_outlined, size: 40),
          ),
        ],
      ),
      drawer: Drawer(
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
              title: const Text('Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProfileScreen(username: widget.username),
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
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: const Text('Notifications'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationsScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: const Text('Sign Out '),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: "Hello Rocky,",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: "\nTime is a very scarce resource. Use it wisely!",
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              Text(
                formatDate(_selectedDate),
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Divider(),
              Theme(
                data: Theme.of(context).copyWith(
                  datePickerTheme: DatePickerThemeData(
                    elevation: 2,
                    dividerColor: Colors.black,
                    todayBackgroundColor: WidgetStateProperty.all<Color>(
                      Colors.blue,
                    ),
                    todayBorder: BorderSide(color: Colors.black),
                    todayForegroundColor: WidgetStateProperty.all<Color>(
                      Colors.white,
                    ),
                  ),
                ),
                child: CalendarDatePicker(
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2040),
                  onDateChanged: (value) {
                    setState(() {
                      _selectedDate = value;
                    });
                  },
                ),
              ),
              const Divider(),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(
                              formattedDate: formatDate(_selectedDate),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(12.0),
                        color: Colors.greenAccent,
                        child: Text(
                          "Schedule for the day",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const AddScheduleDialog();
                        },
                      );
                    },
                    icon: Icon(
                      Icons.add_circle_outline,
                      size: 40,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 40.0,
                ),
                child: Text(
                  "Click the add + button to add new activity.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              // Column(
              //   children: [
              //     scheduleDetails("Work out - 9.00 am"),
              //     scheduleDetails("Meeting - 11.00 am"),
              //     scheduleDetails("Lunch - 2.00 pm"),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Row scheduleDetails(String txt) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey)),
            ),
            child: Text(txt),
          ),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.edit_outlined)),
      ],
    );
  }
}
