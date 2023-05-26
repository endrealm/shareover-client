import 'package:flutter/material.dart';
import 'package:shareover/pages/map/router.dart';
import 'package:shareover/pages/setup/setup.dart';
import 'package:shareover/services/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
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
    print("Update with" + APIService.of(context).authorized.toString());

    return APIService.of(context).authorized
        ? const RouterWidget()
        : const SetupWidget();
  }
}
