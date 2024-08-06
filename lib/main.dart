import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_zadanie/features/hotel_reservation/data/respositories/hotel_data_repository.dart';
import 'package:test_zadanie/features/hotel_reservation/presentation/bloc/hotel_data_bloc.dart';
import 'package:test_zadanie/features/hotel_reservation/presentation/bloc/hotel_data_event.dart';
import 'package:test_zadanie/features/hotel_reservation/presentation/pages/first_screen/first_screen.dart';
import 'package:test_zadanie/features/reservation_details/presentation/bloc/details_bloc.dart';
import 'package:test_zadanie/features/reservation_details/presentation/bloc/details_event.dart';
import 'package:test_zadanie/features/room_reservation/presentation/bloc/room_reservation_bloc.dart';
import 'package:test_zadanie/features/room_reservation/presentation/bloc/room_reservation_event.dart';
import 'package:test_zadanie/old/providers/place_provider.dart';

void main() {
  runApp(const MyApp());
}

ChangeNotifierProvider<PlaceProvider> placeProvider =
    ChangeNotifierProvider<PlaceProvider>((ref) {
  return PlaceProvider();
});

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HotelDataBloc(
        itemRepository: HotelDataRepository(),
      )..add(FetchHotelData()),
      child: BlocProvider(
        create: (context) => RoomReservationBloc(
          itemRepository: HotelDataRepository(),
        )..add(FetchRoomData()),
        child: BlocProvider(
          create: (context) => DetailsBloc(
            itemRepository: HotelDataRepository(),
          )..add(FetchDetails()),
          child: const MaterialApp(
            home: FirstScreen(),
          ),
        ),
      ),
    );
  }
}
