import 'package:flutter/material.dart';
import 'package:test_zadanie/core/typography.dart';

class InfoTile extends StatelessWidget {
  const InfoTile({
    required this.valueKey,
    required this.value,
    this.spaceBetween = false,
    this.valueKeyColor,
    super.key,
  });

  final String valueKey;
  final String value;
  final bool spaceBetween;
  final Color? valueKeyColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            valueKey,
            style: AppTypography.style1640019.copyWith(
              color: const Color(0xFF828796),
            ),
          ),
        ),
        spaceBetween
            ? Text(
                value,
                style:
                    AppTypography.style1640019.copyWith(color: valueKeyColor),
              )
            : Expanded(
                child: Text(
                  value,
                  style:
                      AppTypography.style1640019.copyWith(color: valueKeyColor),
                ),
              ),
      ],
    );
  }
}
