import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_hunt/core/resources/color_manager.dart';
import 'package:furni_hunt/features/home/presentation/manager/product_view_cubit/product_view_cubit.dart';
import 'package:furni_hunt/features/home/presentation/view/widget/product_side_photos.dart';

class ProductViewImage extends StatefulWidget {
  const ProductViewImage({super.key, required this.productImages});
  final List<dynamic> productImages;
  @override
  State<ProductViewImage> createState() => _ProductViewImageState();
}

class _ProductViewImageState extends State<ProductViewImage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductViewCubit(),
      child: BlocBuilder<ProductViewCubit, ProductViewState>(
        builder: (context, state) {
          int selectedPhoto =
              BlocProvider.of<ProductViewCubit>(context).selectedPhoto;
          return GestureDetector(
            onHorizontalDragEnd: (details) {
              if (details.primaryVelocity! > 0) {
                BlocProvider.of<ProductViewCubit>(context)
                    .onDragRight(length: widget.productImages.length);
                print("draged right");
              }
              if (details.primaryVelocity! < 0) {
                BlocProvider.of<ProductViewCubit>(context)
                    .onDragLeft(length: widget.productImages.length);
                print("draged left");
              }
            },
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  height: 250,
                  width: MediaQuery.sizeOf(context).width,
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                              height: 250,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: NetworkImage(
                                  widget.productImages[selectedPhoto],
                                ),
                                fit: BoxFit.contain,
                              )),
                            )
                          ],
                        ),
                      ),
                      ProductSidePhotos(
                        productImages: widget.productImages,
                        selectedPhoto: selectedPhoto,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                    height: 20,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.productImages.length,
                        itemBuilder: (context, index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn,
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: selectedPhoto == index
                                      ? ColorManager.primary
                                      : ColorManager.greyDeep,
                                ),
                              ),
                            )),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
