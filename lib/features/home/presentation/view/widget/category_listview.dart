import 'package:flutter/material.dart';
import 'package:furni_hunt/core/utils/app_router.dart';
import 'package:furni_hunt/features/home/data/model/category_model.dart';
import 'package:furni_hunt/features/home/presentation/view/widget/category_container.dart';
import 'package:go_router/go_router.dart';

class CategorylistView extends StatelessWidget {
  const CategorylistView({
    super.key,
    required this.categoryList,
  });

  final List<CategoryModel> categoryList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "Category",
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 20),
          child: SizedBox(
              height: 178,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: categoryList.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: GestureDetector(
                    onTap: (){
                      GoRouter.of(context).push(RouterPath.categoryView,extra: categoryList[index].name);
                    },
                    child: CategoryContainer(
                        categorymodel: categoryList[index]),
                  ),
                ),
              )),
        ),
      ],
    );
  }
}