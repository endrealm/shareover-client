import 'package:flutter/material.dart';

class NoLocationService extends StatelessWidget {
  const NoLocationService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "ShareOver",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Scaffold(
          body: Center(
            child: Text(
                "You need to allow location tracking for this app to work!"),
          ),
        ));
  }
}
