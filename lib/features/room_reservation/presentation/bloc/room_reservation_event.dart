import 'package:equatable/equatable.dart';

abstract class RoomDataEvent extends Equatable {
  const RoomDataEvent();

  @override
  List<Object> get props => [];
}

class FetchRoomData extends RoomDataEvent {}