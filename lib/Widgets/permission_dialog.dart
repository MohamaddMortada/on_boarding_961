import 'package:flutter/material.dart';

class PermissionDialog extends StatelessWidget {
  final VoidCallback onEnable;
  final VoidCallback onDisable;

  const PermissionDialog({
    required this.onEnable,
    required this.onDisable,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "961 Would Like to Send You Push Notifications",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: const Text(
        "Enable notifications to get updates, breaking news, giveaways, and more.",
      ),
      actions: [
        TextButton(
          onPressed: onDisable,
          child: const Text("Don't Allow", style: TextStyle(color: Colors.red)),
        ),
        TextButton(
          onPressed: onEnable,
          child: const Text("OK", style: TextStyle(color: Colors.green)),
        ),
      ],
    );
  }
}
