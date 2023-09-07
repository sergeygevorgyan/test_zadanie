import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_zadanie/core/typography.dart';
import 'package:test_zadanie/data/models/booking_data.dart';
import 'package:test_zadanie/main.dart';
import 'package:test_zadanie/presentation/third_screen.dart/widgets/info_tile.dart';
import 'package:test_zadanie/presentation/third_screen.dart/widgets/person_info_tile.dart';
import 'package:test_zadanie/presentation/widgets/app_large_button.dart';
import 'package:test_zadanie/presentation/widgets/app_textfield.dart';
import 'package:test_zadanie/presentation/widgets/masked_text_field.dart';
import 'package:test_zadanie/presentation/widgets/rating_tile.dart';
import 'package:test_zadanie/presentation/widgets/spacers.dart';

class ThirdScreen extends HookConsumerWidget {
  const ThirdScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final placeprovider = ref.watch(placeProvider);
    final formKey = List.generate(10, (index) => GlobalKey<FormState>());
    return FutureBuilder(
      future: placeprovider.fetchBookingData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final BookingData data = snapshot.data!;
          final String totalPrice =
              '${(data.tour_price.toInt() + data.fuel_charge.toInt() + data.service_charge.toInt()).toString().substring(0, 3)} ${(data.tour_price.toInt() + data.fuel_charge.toInt() + data.service_charge.toInt()).toString().substring(3, 6)} ₽';
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                'Бронирование',
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
            body: ListView(
              children: [
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RatingTile(
                        rating: 5,
                        ratingName: data.rating_name,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        data.hotel_name,
                        style: AppTypography.headerStyle,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        data.hotel_adress,
                        style: AppTypography.bodyStyle.copyWith(
                          color: const Color(0xFF0D72FF),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      InfoTile(valueKey: 'Вылет из', value: data.departure),
                      const SizedBox(height: 16),
                      InfoTile(
                          valueKey: 'Страна,город',
                          value: data.arrival_country),
                      const SizedBox(height: 16),
                      InfoTile(
                          valueKey: 'Даты',
                          value:
                              '${data.tour_date_start} - ${data.tour_date_stop}'),
                      const SizedBox(height: 16),
                      InfoTile(
                          valueKey: 'Кол-во ночей',
                          value: '${data.horating} ночей'),
                      const SizedBox(height: 16),
                      InfoTile(valueKey: 'Отель', value: data.hotel_adress),
                      const SizedBox(height: 16),
                      InfoTile(valueKey: 'Номер', value: data.room),
                      const SizedBox(height: 16),
                      InfoTile(valueKey: 'Питание', value: data.nutrition),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Информация о покупателе',
                        style: AppTypography.headerStyle,
                      ),
                      const SizedBox(height: 20),
                      const MaskedTextField(),
                      const SizedBox(height: 8),
                      AppTextField(
                        label: 'Почта',
                        onEditingComplete: () {},
                        validator: (p0) {
                          if (p0!.isEmpty) {
                            return 'Required';
                          } else if (p0.isNotEmpty &&
                              !EmailValidator.validate(p0)) {
                            return 'Enter valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту',
                        style: AppTypography.style1440019.copyWith(
                          color: const Color(0XFF828796),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                PersonInfoTile(fkey: formKey),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      InfoTile(
                        valueKey: 'Тур',
                        value:
                            '${data.tour_price.toStringAsFixed(0).substring(0, 3)} ${data.tour_price.toStringAsFixed(0).substring(3, 6)} ₽',
                        spaceBetween: true,
                      ),
                      const SizedBox(height: 16),
                      InfoTile(
                        valueKey: 'Топливный сбор',
                        value:
                            '${data.fuel_charge.toStringAsFixed(0).substring(0, 1)} ${data.fuel_charge.toStringAsFixed(0).substring(1, 4)} ₽',
                        spaceBetween: true,
                      ),
                      const SizedBox(height: 16),
                      InfoTile(
                        valueKey: 'Сервисный сбор',
                        value:
                            '${data.service_charge.toStringAsFixed(0).substring(0, 1)} ${data.service_charge.toStringAsFixed(0).substring(1, 4)} ₽',
                        spaceBetween: true,
                      ),
                      const SizedBox(height: 16),
                      InfoTile(
                        valueKey: 'К оплате',
                        value: totalPrice,
                        spaceBetween: true,
                        valueKeyColor: const Color(0xFF0D72FF),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
                const HeightSpacer(height: 100),
              ],
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              color: Colors.white,
              width: double.infinity,
              height: 88,
              child: AppLargeButton(
                label: 'Оплатить $totalPrice',
                onTap: () {
                  for (var element in formKey) {
                    element.currentState?.validate();
                  }

                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => const FinalScreen(),
                  //   ),
                  // );
                },
              ),
            ),
          );
        }
      },
    );
  }
}
