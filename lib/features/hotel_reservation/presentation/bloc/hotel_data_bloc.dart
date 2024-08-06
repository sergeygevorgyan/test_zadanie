import 'package:bloc/bloc.dart';
import 'package:test_zadanie/features/hotel_reservation/data/models/place.dart';
import 'package:test_zadanie/features/hotel_reservation/data/respositories/hotel_data_repository.dart';
import 'package:test_zadanie/features/hotel_reservation/presentation/bloc/hotel_data_event.dart';
import 'package:test_zadanie/features/hotel_reservation/presentation/bloc/hotel_data_state.dart';

class HotelDataBloc extends Bloc<HotelDataEvent, HotelDataState> {
  final HotelDataRepository itemRepository;

  HotelDataBloc({required this.itemRepository})
      : super(HotelDataInitialState()) {
    on<FetchHotelData>((event, emit) async {
      late Place fetchedPlace;
      emit(HotelDataLoadingState());
      //Imitating server response delay
      await Future.delayed(const Duration(milliseconds: 500)).then((value) {
        fetchedPlace = const Place(
          id: 1,
          adress: 'ул. Адмирала Исакова 1',
          name: 'Гранд Элеон',
          minimal_price: 100000,
          price_for_it: '',
          rating: 5,
          rating_name: 'Отлично',
          image_urls: [
            'https://www.peninsula.com/en/-/media/01-hong-kong-property/exterior-2_5000x2811.jpg?mw=905&hash=934337A3F240DDF77532E22A9E1EA451'
          ],
          about_the_hotel: {'peculiarities': [], 'description': ''},
        );
      });

      emit(
        HotelDataLoadedState(
          placedata: fetchedPlace,
        ),
      );
    });
  }
}
