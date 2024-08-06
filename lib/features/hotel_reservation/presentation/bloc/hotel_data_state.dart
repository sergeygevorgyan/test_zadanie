import 'package:equatable/equatable.dart';
import 'package:test_zadanie/features/hotel_reservation/data/models/place.dart';

abstract class HotelDataState extends Equatable {
  const HotelDataState();
  @override
  List<Object> get props => [];
}

class HotelDataInitialState extends HotelDataState {}

class HotelDataLoadingState extends HotelDataState {}

class HotelDataLoadedState extends HotelDataState {
  final Place placedata;
  const HotelDataLoadedState({
    required this.placedata,
  });
}
