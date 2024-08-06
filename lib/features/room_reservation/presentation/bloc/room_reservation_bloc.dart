import 'package:bloc/bloc.dart';
import 'package:test_zadanie/features/hotel_reservation/data/models/room.dart';
import 'package:test_zadanie/features/hotel_reservation/data/respositories/hotel_data_repository.dart';
import 'package:test_zadanie/features/room_reservation/presentation/bloc/room_reservation_event.dart';
import 'package:test_zadanie/features/room_reservation/presentation/bloc/room_reservation_state.dart';

class RoomReservationBloc extends Bloc<RoomDataEvent, RoomDataState> {
  final HotelDataRepository itemRepository;

  RoomReservationBloc({required this.itemRepository})
      : super(RoomDataInitialState()) {
    on<FetchRoomData>((event, emit) async {
      late List<Room> roomData;
      emit(RoomDataLoadingState());
      //Imitating server response delay
      await Future.delayed(const Duration(milliseconds: 500)).then((value) {
        roomData = [
          const Room(
            id: 0,
            name: 'Эконом',
            peculiarities: [],
            price: 1000000,
            price_per: '',
            image_urls: [
              'https://as2.ftcdn.net/v2/jpg/01/31/18/99/1000_F_131189921_fPJ1kC71fA5hZhC7H2b6bVZRRv2WADQg.jpg'
            ],
          ),
          const Room(
            id: 1,
            name: 'Люкс',
            peculiarities: [],
            price: 15000000,
            price_per: '',
            image_urls: [
              'https://as2.ftcdn.net/v2/jpg/02/60/39/25/1000_F_260392508_GwfkN35u5UgBXYrHbTgmSKW4V67GAPKG.jpg'
            ],
          ),
        ];
      });

      emit(
        RoomDataLoadedState(
          roomData: roomData,
        ),
      );
    });
  }
}
