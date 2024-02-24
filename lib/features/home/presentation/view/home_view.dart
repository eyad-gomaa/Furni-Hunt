import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furni_hunt/core/resources/color_manager.dart';
import 'package:furni_hunt/features/home/data/repo/home_repo/home_repo_impl.dart';
import 'package:furni_hunt/features/home/presentation/manager/fetch_data_cubit/fetch_data_cubit.dart';
import 'package:furni_hunt/features/home/presentation/view/widget/custom_home_app_bar.dart';
import 'package:furni_hunt/features/home/presentation/view/widget/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FetchDataCubit(repo: HomeRepoImpl())..fetchProducts(),
      child: Scaffold(
        appBar: customHomeAppBar(context),
        body: const SafeArea(
          child: HomeViewBody(),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Center(
              child: Icon(FontAwesomeIcons.bagShopping,
                  color: ColorManager.primary),
            )),
      ),
    );
  }
}
