// ignore_for_file: constant_identifier_names

import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static const String TOKEN = "TOKEN";
  static const String ISBIOMETRICENABLED = "ISBIOMETRICENABLED";

  static setBool(bool value, String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value); // Use setBool for boolean values
    log("$value is stored in key - $key");
  }

  static Future<bool?> getBool(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  static setString(dynamic value, dynamic key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
    log("$value is stored in key - $key");
  }

  static Future<String?> getString(var key) async {
    final prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString(key);
    return value;
  }

  static clearStorage() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
