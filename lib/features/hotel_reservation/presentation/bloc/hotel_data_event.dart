import 'package:equatable/equatable.dart';

abstract class HotelDataEvent extends Equatable {
  const HotelDataEvent();

  @override
  List<Object> get props => [];
}

class FetchHotelData extends HotelDataEvent {}