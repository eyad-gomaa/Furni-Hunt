part of 'cart_and_favourites_cubit.dart';

sealed class CartAndFavouritesState {}

final class FavouritesInitial extends CartAndFavouritesState {}

final class AddToFavouritesLoading extends CartAndFavouritesState {}
final class AddToFavouritesSuccess extends CartAndFavouritesState {}

final class AddToFavouritesFailure extends CartAndFavouritesState {}

final class FetchFavouritesLoading extends CartAndFavouritesState {}

final class FetchFavouritesSuccess extends CartAndFavouritesState {
  final List<ProductModel> favList;

  FetchFavouritesSuccess({required this.favList});
}

final class FetchFavouritesFailure extends CartAndFavouritesState {
  final String errMessage;
  FetchFavouritesFailure({required this.errMessage});
}
