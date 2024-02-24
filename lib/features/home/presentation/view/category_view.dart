import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_hunt/features/home/data/repo/home_repo/home_repo_impl.dart';
import 'package:furni_hunt/features/home/presentation/manager/get_category_cubit/get_category_cubit.dart';
import 'package:furni_hunt/features/home/presentation/view/widget/category_appbar.dart';
import 'package:furni_hunt/features/home/presentation/view/widget/category_view_body.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetCategoryCubit(HomeRepoImpl())..fetchProducts(category: category),
      child: Scaffold(
          appBar: categoryAppBar(context,category),
          body: SafeArea(
            child: CategoryViewBody(
              category: category,
            ),
          )),
    );
  }

}
