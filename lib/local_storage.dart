import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:time_manager/login_screen.dart';

// Function to save user profile data
Future<void> saveUserProfile(Map<String, dynamic> profile) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('userProfile', jsonEncode(profile));
}

// Function to retrieve user profile data
Future<Map<String, dynamic>?> getUserProfile() async {
  final prefs = await SharedPreferences.getInstance();
  final profileString = prefs.getString('userProfile');
  return profileString != null ? jsonDecode(profileString) : null;
}

Future<void> saveUserData(Map<String, dynamic> schedue) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('userScheduleMap', jsonEncode(schedue));
}

void signOut(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => LoginScreen()),
  );
}
