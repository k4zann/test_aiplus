import 'package:flutter/material.dart';
import 'package:test_aiplus/core/constants/app_colors.dart';

class TaskTextField extends StatelessWidget {
  const TaskTextField({super.key, required this.controller, this.hintText});
  final TextEditingController controller;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText ?? '',
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: AppColors.lightBlack),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: AppColors.lightBlack),
        ),
      ),
    );
  }
}
