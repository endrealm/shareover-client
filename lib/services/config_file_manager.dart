import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigFileManager {
  Future<String> loadConfig() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString("token") ?? "";
  }

  Future<void> writeConfig(String content) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("token", content);
  }
}