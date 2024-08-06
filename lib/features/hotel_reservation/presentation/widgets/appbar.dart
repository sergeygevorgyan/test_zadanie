import 'package:flutter/material.dart';

class AppAppBar extends StatelessWidget {
  const AppAppBar({
    required this.label,
    super.key,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(label),
    );
  }
}
