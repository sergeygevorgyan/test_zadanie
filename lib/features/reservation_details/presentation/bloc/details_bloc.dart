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
              tour_price: 2500000);

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
