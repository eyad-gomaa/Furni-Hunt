import 'package:flutter/material.dart';
import 'package:furni_hunt/core/resources/color_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.color,
    required this.onTap, this.isLoading,
  });
  final Color? color;
  final String text;
  final Function() onTap;
  final bool? isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: 57,
        decoration: BoxDecoration(
            color: color ?? ColorManager.primary,
            borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: isLoading == true ? const Center(child: CircularProgressIndicator(),) : Text(
            text,
            style: TextStyle(
                color: ColorManager.black,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
