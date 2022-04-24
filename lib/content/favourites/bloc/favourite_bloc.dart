import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  FavouriteBloc() : super(FavouriteInitial()) {
    on<FavouriteEvent>(_getApiData);
    // TODO: implement event handler
  }

  void _getApiData(FavouriteEvent event, Emitter emitState) async {
    //
  }

  //Future _getSongData async
}
