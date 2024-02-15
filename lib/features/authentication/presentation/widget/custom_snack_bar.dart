import 'package:flutter/material.dart';

void customSnackBar({required BuildContext context, required String message,Color color = const Color(0xffCED55B)}){
ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(message),
                            backgroundColor: color,
                          ));
}