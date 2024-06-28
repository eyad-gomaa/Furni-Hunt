import 'package:flutter/material.dart';
import 'package:furni_hunt/core/resources/color_manager.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.onTap,
    required this.title,
  });
  final void Function() onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          height: 50,
          decoration: BoxDecoration(
            color: ColorManager.primary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(child: Text(title)),
        ),
      ),
    );
  }
}
