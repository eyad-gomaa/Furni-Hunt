import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_hunt/features/home/data/model/category_model.dart';
import 'package:furni_hunt/features/home/data/model/product_model.dart';
import 'package:furni_hunt/features/home/presentation/manager/fetch_data_cubit/fetch_data_cubit.dart';
import 'package:furni_hunt/features/home/presentation/view/widget/category_listview.dart';
import 'package:furni_hunt/features/home/presentation/view/widget/new_arrival_listview.dart';
import 'package:furni_hunt/features/home/presentation/view/widget/popular_now_container.dart';
import 'package:gap/gap.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchDataCubit, FetchDataState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is FetchDataSuccess) {
          
          List<ProductModel> productList = state.productList;
          return CustomScrollView(
            slivers: [
              const SliverGap(20),
              const SliverToBoxAdapter(
                child: PopularNowContainer(),
              ),
              SliverToBoxAdapter(
                child: CategorylistView(categoryList: categoryList),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "New arrivals",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      NewArrivalListView(productList: productList),
                    ],
                  ),
                ),
              )
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}



