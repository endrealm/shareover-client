import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:json_theme/json_theme.dart';
import 'package:location/location.dart';
import 'package:shareover/pages/map/router.dart';
import 'package:shareover/pages/setup/setup.dart';
import 'package:shareover/services/api_service.dart';

import 'package:flutter/services.dart';
import 'dart:convert';
import 'no_location.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final themeStr = await rootBundle.loadString('assets/appainter_theme.json');
  final themeJson = jsonDecode(themeStr);
  final theme = ThemeDecoder.decodeThemeData(themeJson)!;

  if (!await enableLocationServices()) {
    log("Failed to activate location service");
    runApp(const NoLocationService());
    return;
  }

  runApp(MyApp(theme: theme));
}

Future<bool> enableLocationServices() async {
  Location location = Location();

  bool serviceEnabled;
  PermissionStatus permissionGranted;

  serviceEnabled = await location.serviceEnabled();
  if (!serviceEnabled) {
    serviceEnabled = await location.requestService();
    if (!serviceEnabled) {
      return false;
    }
  }

  permissionGranted = await location.hasPermission();
  if (permissionGranted == PermissionStatus.denied) {
    permissionGranted = await location.requestPermission();
    if (permissionGranted != PermissionStatus.granted) {
      return false;
    }
  }

  return true;
}

class MyApp extends StatelessWidget {
  final ThemeData theme;
  const MyApp({super.key, required this.theme});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      home: const ApiServiceWrapper(
        child: AppPage(),
      ),
    );
  }
}

class AppPage extends StatelessWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: APIService.of(context).authorized
          ? const RouterWidget()
          : const SetupWidget(),
    );
  }
}
