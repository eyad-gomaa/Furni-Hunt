import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class OverAppLoadingIndicator extends StatelessWidget {
  const OverAppLoadingIndicator({super.key});
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        color: Colors.black.withOpacity(0.5), // Semi-transparent background
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

}