part of 'product_view_cubit.dart';

@immutable
sealed class ProductViewState {}

final class ProductViewInitial extends ProductViewState {}
final class ChangePhotoSuccess extends ProductViewState {}
