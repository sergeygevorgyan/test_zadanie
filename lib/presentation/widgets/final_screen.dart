import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test_zadanie/core/typography.dart';
import 'package:test_zadanie/gen/assets.gen.dart';
import 'package:test_zadanie/presentation/first_screen/first_screen.dart';
import 'package:test_zadanie/presentation/widgets/app_large_button.dart';
import 'package:test_zadanie/presentation/widgets/spacers.dart';

class FinalScreen extends StatelessWidget {
  const FinalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final randomNumber = Random().nextInt(999999);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Заказ оплачен',
          style: TextStyle(
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.chevron_left_outlined,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            Assets.images.frame610.path,
            height: 94,
          ),
          const HeightSpacer(height: 32),
          Text(
            'Ваш заказ принят в работу',
            style: AppTypography.headerStyle,
          ),
          const HeightSpacer(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23),
            child: Text(
              'Подтверждение заказа №$randomNumber может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.',
              style: AppTypography.style1640019.copyWith(
                color: const Color(0xFF828796),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        color: Colors.white,
        width: double.infinity,
        height: 88,
        child: AppLargeButton(
          label: 'Супер!',
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const FirstScreen(),
              ),
            );
          },
        ),
      ),
    );
  }
}
