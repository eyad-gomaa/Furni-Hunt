import 'package:flutter/material.dart';

class FormFieldLabel extends StatelessWidget {
  const FormFieldLabel({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Colors.black,
            ),
      ),
    );
  }
}