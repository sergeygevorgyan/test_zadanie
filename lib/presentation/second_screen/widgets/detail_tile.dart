import 'package:flutter/material.dart';
import 'package:test_zadanie/core/typography.dart';

class DetailTile extends StatelessWidget {
  const DetailTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      color: const Color.fromRGBO(13, 114, 255, 0.10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 10),
          Text(
            'Подробнее о номере',
            style: AppTypography.style1650019.copyWith(
              color: const Color(0xFF0D72FF),
            ),
          ),
          const Icon(
            Icons.chevron_right,
            color: Color(0xFF0D72FF),
          ),
        ],
      ),
    );
  }
}
