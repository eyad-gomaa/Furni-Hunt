import 'package:flutter/material.dart';

void showAlertDialog({required BuildContext context, required String text}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              child: Text(
                text,
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            titlePadding: const EdgeInsets.all(50),
          );
        });
  }

