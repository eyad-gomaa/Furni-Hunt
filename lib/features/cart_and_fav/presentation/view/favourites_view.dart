import 'package:flutter/material.dart';
import 'package:furni_hunt/features/cart_and_fav/presentation/view/widgets/favourites_view_body.dart';

class FavouritesView extends StatelessWidget {
  const FavouritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Wish List",
          style: Theme.of(context).textTheme.displaySmall,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: const FavouritesViewBody(),
    );
  }
}
