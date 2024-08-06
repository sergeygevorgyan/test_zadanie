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
      emit(HotelDataLoadingState());
      await Future.delayed(const Duration(milliseconds: 500)).then((value) {
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
      });
      // try {
      //   final items = await itemRepository.fetchItems();
      //   emit(ItemLoaded(items: items));
      // } catch (e) {
      //   emit(ItemError(message: e.toString()));
      // }
    });
  }
}
