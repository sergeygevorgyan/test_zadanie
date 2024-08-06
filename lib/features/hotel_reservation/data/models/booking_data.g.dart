// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingData _$BookingDataFromJson(Map<String, dynamic> json) => BookingData(
      id: json['id'] as int,
      arrival_country: json['arrival_country'] as String,
      departure: json['departure'] as String,
      fuel_charge: (json['fuel_charge'] as num).toDouble(),
      horating: json['horating'] as int,
      hotel_adress: json['hotel_adress'] as String,
      rating_name: json['rating_name'] as String,
      hotel_name: json['hotel_name'] as String,
      room: json['room'] as String,
      number_of_nights: json['number_of_nights'] as int,
      nutrition: json['nutrition'] as String,
      service_charge: (json['service_charge'] as num).toDouble(),
      tour_date_start: json['tour_date_start'] as String,
      tour_date_stop: json['tour_date_stop'] as String,
      tour_price: (json['tour_price'] as num).toDouble(),
    );

Map<String, dynamic> _$BookingDataToJson(BookingData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hotel_name': instance.hotel_name,
      'hotel_adress': instance.hotel_adress,
      'horating': instance.horating,
      'rating_name': instance.rating_name,
      'departure': instance.departure,
      'arrival_country': instance.arrival_country,
      'tour_date_start': instance.tour_date_start,
      'tour_date_stop': instance.tour_date_stop,
      'number_of_nights': instance.number_of_nights,
      'room': instance.room,
      'nutrition': instance.nutrition,
      'tour_price': instance.tour_price,
      'fuel_charge': instance.fuel_charge,
      'service_charge': instance.service_charge,
    };
