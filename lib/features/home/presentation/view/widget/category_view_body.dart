import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_hunt/features/home/presentation/manager/get_category_cubit/get_category_cubit.dart';
import 'package:furni_hunt/features/home/presentation/view/widget/new_arrival_listview.dart';

class CategoryViewBody extends StatelessWidget {
  const CategoryViewBody({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: BlocBuilder<GetCategoryCubit, GetCategoryState>(
        builder: (context, state) {
          if (state is GetCategorySuccess) {
            if (state.productList.isNotEmpty) {
              return NewArrivalListView(productList: state.productList);
            } else {
              return const Center(
                child: Text("There is No Products In This Category"),
              );
            }
          } else if (state is GetCategoryFailure) {
            return Center(
              child: Text(state.errMessage),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
