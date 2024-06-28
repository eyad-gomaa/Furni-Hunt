import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_hunt/core/resources/color_manager.dart';
import 'package:furni_hunt/features/payment/data/model/address_model.dart';
import 'package:furni_hunt/features/payment/presentation/manager/checkout_cubit/checkout_cubit.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class AddAdressViewBody extends StatefulWidget {
  const AddAdressViewBody({super.key});
  
  @override
  State<AddAdressViewBody> createState() => _AddAdressViewBodyState();
}

class _AddAdressViewBodyState extends State<AddAdressViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController governorateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                    color: ColorManager.whiteShade,
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Delivery address",
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        const Gap(30),
                        AddressInputField(
                          controller: governorateController,
                          title: 'governorate',
                        ),
                        const Gap(20),
                        AddressInputField(
                          controller: cityController,
                          title: 'city',
                        ),
                        const Gap(20),
                        AddressInputField(
                          controller: streetController,
                          title: 'street',
                        ),
                        const Gap(20),
                        AddressInputField(
                          controller: detailsController,
                          title: 'more details',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: GestureDetector(
            onTap: () {
              AddressModel address = AddressModel(
                governorate: governorateController.text,
                city: cityController.text,
                street: streetController.text,
                additionalDetails: detailsController.text,
              );
              if (formKey.currentState!.validate()) {
                BlocProvider.of<CheckoutCubit>(context)
                    .addAddress(addressModel: address);
                GoRouter.of(context).pop();
              }
            },
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: 50,
              decoration: BoxDecoration(
                color: ColorManager.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(child: Text("add")),
            ),
          ),
        ),
      ],
    );
  }
}

class AddressInputField extends StatelessWidget {
  const AddressInputField(
      {super.key, required this.controller, required this.title});
  final TextEditingController controller;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        const Gap(10),
        TextFormField(
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontWeight: FontWeight.normal),
          decoration: InputDecoration(
            fillColor: ColorManager.whiteShade,
            border: customOutlineInputBorder(),
            enabledBorder: customOutlineInputBorder(),
            focusedBorder: customOutlineInputBorder(),
          ),
          controller: controller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "required rield";
            } else {
              return null;
            }
          },
        ),
      ],
    );
  }

  OutlineInputBorder customOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: ColorManager.black),
      borderRadius: BorderRadius.circular(8),
    );
  }
}
