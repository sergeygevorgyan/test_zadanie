import 'package:flutter/material.dart';
import 'package:test_zadanie/core/typography.dart';
import 'package:test_zadanie/features/hotel_reservation/data/models/room.dart';
import 'package:test_zadanie/features/hotel_reservation/presentation/pages/second_screen/widgets/detail_tile.dart';
import 'package:test_zadanie/features/hotel_reservation/presentation/pages/third_screen.dart/third_screen.dart';
import 'package:test_zadanie/features/hotel_reservation/presentation/widgets/app_large_button.dart';
import 'package:test_zadanie/features/hotel_reservation/presentation/widgets/image_slider.dart';
import 'package:test_zadanie/features/hotel_reservation/presentation/widgets/spacers.dart';
import 'package:test_zadanie/features/hotel_reservation/presentation/widgets/tag_tile.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    required this.room,
    super.key,
  });

  final Room room;

  @override
  Widget build(BuildContext context) {
    final tags = List.generate(
      room.peculiarities.length,
      (index) => TagTile(label: room.peculiarities[index]),
    );
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageSlider(imageUrls: room.image_urls),
            const HeightSpacer(height: 8),
            Text(
              room.name,
              style: AppTypography.headerStyle,
            ),
            const HeightSpacer(height: 8),
            Wrap(
              spacing: 8,
              children: tags,
            ),
            const HeightSpacer(height: 8),
            const DetailTile(),
            const HeightSpacer(height: 16),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'aaa',
                    // '${room.price.toString().substring(0, 3)} ${room.price.toString().substring(3, 6)} ₽ ',
                    style: AppTypography.style3060036
                        .copyWith(color: Colors.black),
                  ),
                  TextSpan(
                    text: ' ${room.price_per}',
                    style: AppTypography.style1440019.copyWith(
                      color: const Color(0xFF828796),
                    ),
                  ),
                ],
              ),
            ),
            const HeightSpacer(height: 16),
            AppLargeButton(
              label: 'Выбрать номер',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ThirdScreen(),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
