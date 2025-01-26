import 'package:flutter/material.dart';
import 'package:test_aiplus/core/constants/app_colors.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key, required this.onPressed});
  final Function() onPressed;
  

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.lightBlack,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16)),
      child: const Text('Add', style: TextStyle(color: AppColors.white, fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }
}
