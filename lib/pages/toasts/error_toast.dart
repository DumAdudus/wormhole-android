import 'package:flutter/material.dart';

import 'base_toast.dart';
import 'my_toast.dart';

class ErrorToast extends MyToast {
  const ErrorToast({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) => BaseToast(
        message: message,
        color: Colors.redAccent,
        icon: const Icon(Icons.close),
      );
}
