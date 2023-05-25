import 'package:flutter/material.dart';

class SubscriptionWidget extends StatelessWidget {
  final VoidCallback close;
  const SubscriptionWidget({Key? key, required this.close}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: close,
      child: const Text("Close"),
    );
  }
}
