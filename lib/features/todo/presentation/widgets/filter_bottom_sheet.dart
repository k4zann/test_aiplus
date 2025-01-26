import 'package:flutter/material.dart';
import 'package:test_aiplus/core/constants/app_colors.dart';

class FilterBottomSheet extends StatelessWidget {
  final int selectedFilter;
  final Function(int) onFilterSelected;

  const FilterBottomSheet({
    super.key,
    required this.selectedFilter,
    required this.onFilterSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Filter Tasks',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          RadioListTile<int>(
            title: const Text('All'),
            value: 0,
            groupValue: selectedFilter,
            onChanged: (value) {
              onFilterSelected(value!);
              Navigator.pop(context);
            },
          ),
          RadioListTile<int>(
            title: const Text('Done'),
            value: 1,
            groupValue: selectedFilter,
            onChanged: (value) {
              onFilterSelected(value!);
              Navigator.pop(context);
            },
          ),
          RadioListTile<int>(
            title: const Text('Undone'),
            value: 2,
            groupValue: selectedFilter,
            onChanged: (value) {
              onFilterSelected(value!);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}