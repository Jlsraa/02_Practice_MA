part of 'favourite_bloc.dart';

abstract class FavouriteState extends Equatable {
  const FavouriteState();

  @override
  List<Object> get props => [];
}

class FavouriteInitial extends FavouriteState {}

class FavouriteErrorState extends FavouriteState {
  final String errorMsg;
  FavouriteErrorState({required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}

class FavouriteSuccessState extends FavouriteState {
  final url;
  final albumCover;

  FavouriteSuccessState({required this.url, required this.albumCover});

  @override
  List<Object> get props => [url];
}

class FavouriteLoadingState extends FavouriteState {}
