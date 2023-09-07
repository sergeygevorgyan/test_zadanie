import 'package:flutter/material.dart';
import 'package:test_zadanie/core/typography.dart';

class TagTile extends StatelessWidget {
  const TagTile({required this.label, super.key});
  final String label;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color(0xFFFBFBFC),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Text(
          label,
          style: AppTypography.style1650019.copyWith(
            color: const Color(0xFF828796),
          ),
        ),
      ),
    );
  }
}
