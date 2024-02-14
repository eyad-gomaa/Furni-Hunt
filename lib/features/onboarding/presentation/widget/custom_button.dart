import 'package:flutter/material.dart';
import 'package:furni_hunt/core/resources/color_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.color,
  });
  final Color? color;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 57,
      decoration: BoxDecoration(
          color: color ?? ColorManager.primary,
          borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              color: ColorManager.black,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
