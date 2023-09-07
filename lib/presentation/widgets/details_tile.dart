import 'package:flutter/material.dart';
import 'package:test_zadanie/core/typography.dart';

class DetailsTile extends StatelessWidget {
  const DetailsTile({
    required this.iconPath,
    required this.subtitle,
    required this.title,
    super.key,
  });

  final String title;
  final String subtitle;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 13),
              child: Image.asset(
                iconPath,
                fit: BoxFit.cover,
                height: 24,
                width: 24,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTypography.style1650019,
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: AppTypography.style1450016.copyWith(
                    color: Color(0xFF828796),
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(
                  thickness: 1,
                  color: Color.fromRGBO(
                    130,
                    135,
                    150,
                    0.15,
                  ),
                ),
              ],
            ),
          ],
        ),
        const Icon(
          Icons.chevron_right,
          size: 24,
        ),
      ],
    );
  }
}
