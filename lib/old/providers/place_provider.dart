import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test_zadanie/features/hotel_reservation/data/models/booking_data.dart';
import 'package:test_zadanie/features/hotel_reservation/data/models/place.dart';
import 'package:test_zadanie/features/hotel_reservation/data/models/room.dart';

class PlaceProvider extends ChangeNotifier {
  final Map<String, dynamic> prices = {
    'Тур': 0,
    'Топливный сбор': 0,
    'Сервисный сбор': 0,
    'К оплате': 0,
  };
  final dio = Dio();
  Future<Place?> fetchPlaceData() async {
    const Place fetchedPlace = Place(
      id: 1,
      adress: 'adress',
      name: 'name',
      minimal_price: 0,
      price_for_it: '0',
      rating: 5,
      rating_name: 'rating_name',
      image_urls: [
        'https://res.cloudinary.com/cloudinary-marketing/images/c_fill,w_890/f_auto,q_auto/v1647045694/28_SEO_friendly_URLs/28_SEO_friendly_URLs-jpg?_i=AA'
            'https://res.cloudinary.com/cloudinary-marketing/images/c_fill,w_890/f_auto,q_auto/v1647045694/28_SEO_friendly_URLs/28_SEO_friendly_URLs-jpg?_i=AA'
      ],
      about_the_hotel: {'peculiarities': [], 'description': ''},
    );
    return fetchedPlace;
  }

  Future<List<Room>?> fetchRoomsData() async {
    return [
      const Room(
        id: 0,
        name: 'name',
        peculiarities: [],
        price: 5,
        price_per: 'price_per',
        image_urls: [
          'https://res.cloudinary.com/cloudinary-marketing/images/c_fill,w_890/f_auto,q_auto/v1647045694/28_SEO_friendly_URLs/28_SEO_friendly_URLs-jpg?_i=AA'
              'https://res.cloudinary.com/cloudinary-marketing/images/c_fill,w_890/f_auto,q_auto/v1647045694/28_SEO_friendly_URLs/28_SEO_friendly_URLs-jpg?_i=AA'
        ],
      ),
    ];
  }

  Future<BookingData?> fetchBookingData() async {
    return const BookingData(
      id: 5,
      arrival_country: 'arrival_country',
      departure: 'departure',
      fuel_charge: 5,
      horating: 5,
      hotel_adress: 'hotel_adress',
      rating_name: 'rating_name',
      hotel_name: 'hotel_name',
      room: 'room',
      number_of_nights: 5,
      nutrition: '',
      service_charge: 8,
      tour_date_start: '',
      tour_date_stop: 'tour_date_stop',
      tour_price: 5,
    );
  }
}
