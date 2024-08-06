import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_zadanie/core/typography.dart';
import 'package:test_zadanie/features/hotel_reservation/data/models/place.dart';
import 'package:test_zadanie/features/hotel_reservation/presentation/bloc/hotel_data_bloc.dart';
import 'package:test_zadanie/features/hotel_reservation/presentation/bloc/hotel_data_state.dart';
import 'package:test_zadanie/gen/assets.gen.dart';
import 'package:test_zadanie/features/room_reservation/presentation/pages/second_screen/second_screen.dart';
import 'package:test_zadanie/features/hotel_reservation/presentation/widgets/app_large_button.dart';
import 'package:test_zadanie/features/hotel_reservation/presentation/widgets/details_tile.dart';
import 'package:test_zadanie/features/hotel_reservation/presentation/widgets/image_slider.dart';
import 'package:test_zadanie/features/hotel_reservation/presentation/widgets/spacers.dart';
import 'package:test_zadanie/features/hotel_reservation/presentation/widgets/rating_tile.dart';
import 'package:test_zadanie/features/hotel_reservation/presentation/widgets/tag_tile.dart';


class FirstScreen extends ConsumerWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return BlocBuilder<HotelDataBloc, HotelDataState>(
      builder: (context, state) {
        if (state is HotelDataLoadingState) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is HotelDataLoadedState) {
          final Place dummyPlace = state.placedata;
          final List peculiarities =
              dummyPlace.about_the_hotel['peculiarities'];
          final tags = List.generate(
            peculiarities.length,
            (index) => TagTile(
              label: peculiarities[index],
            ),
          );
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                'Отель',
                style: TextStyle(
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ImageSlider(
                          imageUrls: dummyPlace.image_urls,
                        ),
                        const HeightSpacer(height: 21),
                        RatingTile(
                          rating: dummyPlace.rating,
                          ratingName: dummyPlace.rating_name,
                        ),
                        const HeightSpacer(height: 8),
                        Text(
                          dummyPlace.name,
                          style: AppTypography.headerStyle,
                        ),
                        const HeightSpacer(height: 8),
                        Text(
                          dummyPlace.adress,
                          style: AppTypography.bodyStyle.copyWith(
                            color: const Color(0xFF0D72FF),
                          ),
                        ),
                        const HeightSpacer(height: 16),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:  'от ${dummyPlace.minimal_price.toString().substring(0, 3)} ${dummyPlace.minimal_price.toString().substring(3, 6)}  ₽ ',
                                style: AppTypography.style3060036
                                    .copyWith(color: Colors.black),
                              ),
                              TextSpan(
                                text: ' ${dummyPlace.price_for_it}',
                                style: AppTypography.style1440019.copyWith(
                                  color: const Color(0xFF828796),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const HeightSpacer(height: 16),
                      ],
                    ),
                  ),
                  const HeightSpacer(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const HeightSpacer(height: 16),
                        Text(
                          'Об отеле',
                          style: AppTypography.headerStyle.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        const HeightSpacer(height: 16),
                        Wrap(
                          spacing: 8,
                          children: tags,
                        ),
                        const HeightSpacer(height: 12),
                        Text(
                          dummyPlace.about_the_hotel['description'],
                          style: AppTypography.style1640019,
                        ),
                        const HeightSpacer(height: 16),
                        DetailsTile(
                            iconPath: Assets.icons.emojiHappy.path,
                            subtitle: 'Самое необходимое',
                            title: 'Удобства'),
                        DetailsTile(
                            iconPath: Assets.icons.tickSquare.path,
                            subtitle: 'Самое необходимое',
                            title: 'Что включено'),
                        DetailsTile(
                            iconPath: Assets.icons.closeSquare.path,
                            subtitle: 'Самое необходимое',
                            title: 'Что не включено'),
                      ],
                    ),
                  ),
                  const HeightSpacer(height: 100),
                ],
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              color: Colors.white,
              width: double.infinity,
              height: 88,
              child: AppLargeButton(
                label: 'К выбору номера',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          SecondScreen(title: dummyPlace.name),
                    ),
                  );
                },
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
