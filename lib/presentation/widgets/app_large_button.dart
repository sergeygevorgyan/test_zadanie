import 'package:flutter/material.dart';
import 'package:test_zadanie/core/typography.dart';

class AppLargeButton extends StatelessWidget {
  const AppLargeButton({required this.label, required this.onTap, super.key});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      child: Text(
        label,
        style: AppTypography.style1650017,
      ),
    );
  }
}
