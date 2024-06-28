import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_hunt/features/home/data/model/product_model.dart';
import 'package:furni_hunt/features/home/data/repo/home_repo/home_repo.dart';
part 'fetch_data_state.dart';

class FetchDataCubit extends Cubit<FetchDataState> {
  FetchDataCubit({required this.repo}) : super(FetchDataInitial());
  final HomeRepo repo;
  List<ProductModel>? productList;

  void fetchProducts() async {
    var response = await repo.fetchProducts();
    response.fold((l) async {
      productList = l;
      await fetchFavouriteAndCart(productList);
      emit(FetchDataSuccess(productList: l));
    }, (r) => emit(FetchDataFailure(errMessage: r.failureMessage)));
  }

  fetchFavouriteAndCart(productList) async {
    await repo.fetchFavouriteAndCart(productList: productList);
  }
}
