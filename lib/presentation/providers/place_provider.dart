import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test_zadanie/data/models/booking_data.dart';
import 'package:test_zadanie/data/models/place.dart';
import 'package:test_zadanie/data/models/room.dart';

class PlaceProvider extends ChangeNotifier {
  final Map<String, dynamic> prices = {
    'Тур': 0,
    'Топливный сбор': 0,
    'Сервисный сбор': 0,
    'К оплате': 0,
  };
  final dio = Dio();
  Future<Place?> fetchPlaceData() async {
    try {
      const url =
          'https://run.mocky.io/v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3';

      final response = await dio.get(url);

      if (response.statusCode == 200) {
        final responseData = response.data;
        final Place fetchedPlace = Place.fromJson(responseData);
        return fetchedPlace;
        // notifyListeners();
        // print('Data fetched successfully: $responseData');
      } else {
        print('Request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
    return null;
  }

  Future<List<Room>?> fetchRoomsData() async {
    try {
      const url =
          'https://run.mocky.io/v3/f9a38183-6f95-43aa-853a-9c83cbb05ecd';

      final response = await dio.get(url);

      if (response.statusCode == 200) {
        final List<Room> result = [];
        final responseData = response.data;
        final List listOfRooms = responseData['rooms'];
        for (var room in listOfRooms) {
          result.add(
            Room.fromJson(room as Map<String, dynamic>),
          );
        }
        print('Data fetched successfully: $responseData');

        return result;
      } else {
        print('Request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
    return null;
  }

  Future<BookingData?> fetchBookingData() async {
    try {
      const url =
          'https://run.mocky.io/v3/e8868481-743f-4eb2-a0d7-2bc4012275c8';

      final response = await dio.get(url);

      if (response.statusCode == 200) {
        final responseData = response.data;
        final BookingData data = BookingData.fromJson(responseData);

        print('Data fetched successfully: $responseData');

        return data;
      } else {
        print('Request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
    return null;
  }
}
