import 'package:flutter/material.dart';
import 'package:furni_hunt/features/cart_and_fav/presentation/view/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "cart",
            style: Theme.of(context).textTheme.displaySmall,
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: const CartViewBody());
  }
}
