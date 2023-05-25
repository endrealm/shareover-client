import 'package:flutter/material.dart';

class ClosedWidget extends StatelessWidget {
  final VoidCallback close;
  const ClosedWidget({Key? key, required this.close}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: close,
      child: const Text("Close"),
    );
  }
}
