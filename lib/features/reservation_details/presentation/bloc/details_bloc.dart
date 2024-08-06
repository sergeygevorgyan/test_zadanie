import 'package:bloc/bloc.dart';
import 'package:test_zadanie/features/hotel_reservation/data/models/booking_data.dart';
import 'package:test_zadanie/features/hotel_reservation/data/respositories/hotel_data_repository.dart';
import 'package:test_zadanie/features/reservation_details/presentation/bloc/details_event.dart';
import 'package:test_zadanie/features/reservation_details/presentation/bloc/details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final HotelDataRepository itemRepository;

  DetailsBloc({required this.itemRepository}) : super(DetailsInitialState()) {
    on<FetchDetails>((event, emit) async {
      late BookingData bookingData;
      emit(DetailsLoadingState());
      //Imitating server response delay
      await Future.delayed(const Duration(milliseconds: 500)).then(
        (value) {
          bookingData = const BookingData(
            id: 5,
            arrival_country: 'Москва',
            departure: '',
            fuel_charge: 500,
            horating: 50,
            hotel_adress: 'ул. Адмирала Исакова 1',
            rating_name: 'Отлично',
            hotel_name: 'Гранд Элеон',
            room: '1',
            number_of_nights: 5,
            nutrition: '',
            service_charge: 8,
            tour_date_start: '08.07.2024',
            tour_date_stop: '22.07.2024',
            tour_price: 2500000,
          );

          emit(
            DetailsLoadedState(
              data: bookingData,
            ),
          );
        },
      );
    });
  }
}
