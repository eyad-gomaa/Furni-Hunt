import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_hunt/core/shared.dart';
import 'package:furni_hunt/features/cart_and_fav/data/repo/cart_and_fav_repo/cart_and_fav_repo.dart';
import 'package:furni_hunt/features/home/data/model/product_model.dart';
part 'cart_and_favourites_state.dart';

class CartAndFavouritesCubit extends Cubit<CartAndFavouritesState> {
  CartAndFavouritesCubit({required this.repo}) : super(FavouritesInitial());
  final CartAndFavouritesRepo repo;
  List<ProductModel> myWishList = [];
  List<ProductModel> myCartList = [];
  addToFavourites({required ProductModel product}) async {
    try {
      if (wishList.contains(product.productId)) {
        emit(AddToFavouritesLoading());
        wishList.removeWhere((element) => element == product.productId);

        await repo.deleteFromFavourites(product: product);
      } else {
        wishList.add(product.productId);
        await repo.addToFavourites(product: product);
      }
    } on Exception catch (e) {
      emit(AddToFavouritesFailure());
    }
    await fetchWishAndCartProducts();
  }

  addToCart({required ProductModel product}) async {
    try {
      if (cartList.contains(product.productId)) {
        emit(AddToFavouritesLoading());
        cartList.removeWhere((element) => element == product.productId);

        await repo.deleteFromCart(productModel: product);
        emit(AddToFavouritesSuccess());
      } else {
        cartList.add(product.productId);
        await repo.addToCart(productModel: product);
        emit(AddToFavouritesSuccess());
      }
    } on Exception catch (e) {
      emit(AddToFavouritesFailure());
    }
    await fetchWishAndCartProducts();
  }

  fetchWishAndCartProducts() async {
    var fav = await repo.fetchFavouriteProducts();
    fav.fold((l) {
      myWishList = l;
      emit(FetchFavouritesSuccess(favList: l));
    }, (r) {
      emit(FetchFavouritesFailure(errMessage: r.failureMessage));
    });
    var cart = await repo.fetchCartProducts();
    cart.fold((l) {
      myCartList = l;
      emit(FetchFavouritesSuccess(favList: l));
    }, (r) {
      emit(FetchFavouritesFailure(errMessage: r.failureMessage));
    });
  }

  @override
  void onChange(Change<CartAndFavouritesState> change) {
    print(change);
    super.onChange(change);
  }
}
