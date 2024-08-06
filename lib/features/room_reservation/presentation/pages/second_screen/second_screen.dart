import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_zadanie/features/hotel_reservation/data/models/room.dart';
import 'package:test_zadanie/features/room_reservation/presentation/bloc/room_reservation_bloc.dart';
import 'package:test_zadanie/features/room_reservation/presentation/bloc/room_reservation_state.dart';
import 'package:test_zadanie/features/room_reservation/presentation/pages/second_screen/widgets/menu_item.dart';

class SecondScreen extends ConsumerWidget {
  const SecondScreen({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BlocBuilder<RoomReservationBloc, RoomDataState>(
        builder: (context, state) {
      if (state is RoomDataLoadingState) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else if (state is RoomDataLoadedState) {
        final List<Room> rooms = state.roomData;

        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              title,
              style: const TextStyle(
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.chevron_left_outlined,
                color: Colors.black,
              ),
            ),
            elevation: 0,
          ),
          body: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemCount: rooms.length,
            itemBuilder: (context, index) => MenuItem(
              room: rooms[index],
            ),
          ),
        );
      }
      return const SizedBox();
    });
  }
}
