import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'product_view_state.dart';

class ProductViewCubit extends Cubit<ProductViewState> {
  ProductViewCubit() : super(ProductViewInitial());
  int selectedPhoto = 0;

  changePhoto({required int index}) {
    selectedPhoto = index;
    emit(ChangePhotoSuccess());
  }

  onDragRight({required int length}) {
    if (selectedPhoto == 0) {
      selectedPhoto = length-1;
    } else {
      selectedPhoto -= 1;
    }
    emit(ChangePhotoSuccess());
  }

  onDragLeft({required int length}) {
    if (selectedPhoto != length - 1) {
      selectedPhoto += 1;
    } else {
      selectedPhoto = 0;
    }
    emit(ChangePhotoSuccess());
  }
}
