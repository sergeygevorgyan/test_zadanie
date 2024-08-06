import 'package:equatable/equatable.dart';
import 'package:test_zadanie/features/hotel_reservation/data/models/room.dart';

abstract class RoomDataState extends Equatable {
  const RoomDataState();
  @override
  List<Object> get props => [];
}

class RoomDataInitialState extends RoomDataState {}

class RoomDataLoadingState extends RoomDataState {}

class RoomDataLoadedState extends RoomDataState {
  final List<Room> roomData;
  const RoomDataLoadedState({
    required this.roomData,
  });
}
