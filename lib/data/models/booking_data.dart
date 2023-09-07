import 'package:json_annotation/json_annotation.dart';

part 'booking_data.g.dart';

@JsonSerializable()
class BookingData {
  final int id;
  final String hotel_name;
  final String hotel_adress;
  final int horating;
  final String rating_name;
  final String departure;
  final String arrival_country;
  final String tour_date_start;
  final String tour_date_stop;
  final int number_of_nights;
  final String room;
  final String nutrition;
  final double tour_price;
  final double fuel_charge;
  final double service_charge;

  const BookingData({
    required this.id,
    required this.arrival_country,
    required this.departure,
    required this.fuel_charge,
    required this.horating,
    required this.hotel_adress,
    required this.rating_name,
    required this.hotel_name,
    required this.room,
    required this.number_of_nights,
    required this.nutrition,
    required this.service_charge,
    required this.tour_date_start,
    required this.tour_date_stop,
    required this.tour_price,
  });

  factory BookingData.fromJson(Map<String, dynamic> json) =>
      _$BookingDataFromJson(json);

  Map<String, dynamic> toJson() => _$BookingDataToJson(this);
}
