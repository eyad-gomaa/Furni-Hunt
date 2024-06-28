import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_hunt/core/resources/color_manager.dart';
import 'package:furni_hunt/core/utils/app_router.dart';
import 'package:furni_hunt/features/payment/data/model/address_model.dart';
import 'package:furni_hunt/features/payment/presentation/manager/checkout_cubit/checkout_cubit.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckoutCubit, CheckoutState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
              color: ColorManager.whiteShade,
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: state is GetAddressSuccess
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Deliver To",
                        ),
                        const Gap(10),
                        Column(
                          children: [
                            Text(
                                "${state.addressModel.governorate}, ${state.addressModel.city}, ${state.addressModel.street}, ${state.addressModel.additionalDetails}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontWeight: FontWeight.normal)),
                          ],
                        ),
                        const Gap(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const AddAddressButton(
                              title: 'Edit Address',
                            ),
                            GestureDetector(
                              onTap: () {
                                BlocProvider.of<CheckoutCubit>(context)
                                    .deleteAddress();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(8)),
                                child: const Center(
                                    child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(
                                            Icons.delete_outline_rounded))),
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  : const AddAddressButton(
                      title: 'Add Address',
                    )),
        );
      },
    );
  }
}

class AddAddressButton extends StatelessWidget {
  const AddAddressButton({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(RouterPath.addAdressView);
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(), borderRadius: BorderRadius.circular(8)),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.normal)),
        )),
      ),
    );
  }
}
