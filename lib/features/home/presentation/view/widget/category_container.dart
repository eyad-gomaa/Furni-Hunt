import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:furni_hunt/core/resources/color_manager.dart';
import 'package:furni_hunt/features/home/data/model/category_model.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({
    super.key,
    required this.categorymodel,
  });

  final CategoryModel categorymodel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 178,
      width: 136,
      decoration: BoxDecoration(
        color: ColorManager.whiteShade,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 104,
              width: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(imageUrl: categorymodel.image,
                placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
                )
              ),
            ),
          ),
          Text(
            categorymodel.name,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          // Text(
          //   "21 suggested items",
          //   style:
          //       Theme.of(context).textTheme.bodySmall,
          // )
        ],
      ),
    );
  }
}
