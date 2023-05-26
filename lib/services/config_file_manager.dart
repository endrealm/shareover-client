import 'dart:io';

import 'package:flutter/foundation.dart';

class ConfigFileManager {
  Future<String> loadConfig() async {
    try {
      File file = File('config');
      if (await file.exists()) {
        return await file.readAsString();
      }
    } catch (e) {
      if (kDebugMode) {
        print('Fehler beim Laden der Datei: $e');
      }
    }
    return "";
  }

  Future<void> writeConfig(String content) async {
    try {
      File file = File('config');
      await file.writeAsString(content);
    } catch (e) {
      if (kDebugMode) {
        print('Fehler beim Schreiben in die Datei: $e');
      }
    }
  }
}