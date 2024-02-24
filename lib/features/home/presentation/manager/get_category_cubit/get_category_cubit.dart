import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:furni_hunt/features/home/data/model/product_model.dart';
import 'package:furni_hunt/features/home/data/repo/home_repo/home_repo.dart';
import 'package:meta/meta.dart';

part 'get_category_state.dart';

class GetCategoryCubit extends Cubit<GetCategoryState> {
  GetCategoryCubit(this.repo) : super(GetCategoryInitial());
  final HomeRepo repo;
  void fetchProducts({required String category}) async {
    emit(GetCategoryLoading());
    var response = await repo.fetchProductsCategory(category: category);
    response.fold((l) => emit(GetCategorySuccess(productList: l)),
        (r) => emit(GetCategoryFailure(errMessage: r.failureMessage)));
  }
}
