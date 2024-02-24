part of 'fetch_data_cubit.dart';

sealed class FetchDataState {}

final class FetchDataInitial extends FetchDataState {}
final class FetchDataLoading extends FetchDataState {}
final class FetchDataSuccess extends FetchDataState {
  final List<ProductModel> productList;

  FetchDataSuccess({required this.productList});
}
final class FetchDataFailure extends FetchDataState {
  final String errMessage;
  FetchDataFailure({required this.errMessage});
}
