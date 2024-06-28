import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_hunt/core/resources/color_manager.dart';
import 'package:furni_hunt/features/home/presentation/manager/product_view_cubit/product_view_cubit.dart';

class ProductSidePhotos extends StatelessWidget {
  const ProductSidePhotos({
    super.key,
    required this.productImages,
    required this.selectedPhoto,
  });

  final List<dynamic> productImages;
  final int selectedPhoto;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: 67,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: productImages.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  BlocProvider.of<ProductViewCubit>(context)
                      .changePhoto(index: index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.circular(8),
                        border: index == selectedPhoto
                            ? Border.all(color: ColorManager.secondary)
                            : const Border()),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                        width: 59,
                        height: 57,
                        decoration: BoxDecoration(
                            color: ColorManager.secondary,
                            borderRadius: BorderRadius.circular(8)),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              productImages[index],
                            )),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
