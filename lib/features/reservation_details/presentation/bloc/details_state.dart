import 'package:equatable/equatable.dart';
import 'package:test_zadanie/features/hotel_reservation/data/models/booking_data.dart';

abstract class DetailsState extends Equatable {
  const DetailsState();
  @override
  List<Object> get props => [];
}

class DetailsInitialState extends DetailsState {}

class DetailsLoadingState extends DetailsState {}

class DetailsLoadedState extends DetailsState {
  final BookingData data;
  const DetailsLoadedState({required this.data});
}
