import 'package:flutter/material.dart';
import 'package:furni_hunt/features/payment/presentation/view/widgets/add_adress_view_body.dart';
import 'package:go_router/go_router.dart';

class AddAdressView extends StatelessWidget {
  const AddAdressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).pop();
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
              const Text(
                "check out",
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
        ),
        leadingWidth: 120,
      ),
      body: const AddAdressViewBody(),
    );
  }
}
