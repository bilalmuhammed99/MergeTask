import 'package:flutter/material.dart';

void customSnackBar(context,{ required String text, Color? color}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.fixed,
      padding: const EdgeInsets.all(16),
      backgroundColor: color ?? Colors.green,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      content: Text(text),
    ),
  );
}
