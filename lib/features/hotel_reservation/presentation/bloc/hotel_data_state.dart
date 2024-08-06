import 'package:equatable/equatable.dart';

abstract class HotelDataState extends Equatable {

  @override
  List<Object> get props => [];
}

class HotelDataInitialState extends HotelDataState {}

class HotelDataLoadingState extends HotelDataState{
  
}