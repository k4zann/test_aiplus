import 'package:flutter/material.dart';
import 'package:test_aiplus/core/constants/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double elevation;
  final GlobalKey<ScaffoldState>? drawerKey;
  final List<Widget>? actions;
  final Function()? onPressedBack;
  final bool needBackButton;

  const CustomAppBar({
    super.key,
    required this.title,
    this.elevation = 0,
    this.drawerKey,
    this.needBackButton = true,
    this.actions,
    this.onPressedBack,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: AppColors.grey,
      backgroundColor: AppColors.white,
      surfaceTintColor: AppColors.white,
      scrolledUnderElevation: 0.0,
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      elevation: elevation,
      actions: actions,
      leading: needBackButton
          ? GestureDetector(
              onTap: onPressedBack ??
                  () {
                    if (drawerKey != null) {
                      drawerKey!.currentState!.openDrawer();
                    } else {
                      Navigator.pop(context);
                    }
                  },
              child: const Icon(Icons.arrow_back_ios),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
