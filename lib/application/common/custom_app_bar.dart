import 'package:base_project/application/core/utils/app_styling.dart';
import 'package:flutter/material.dart';

import '../core/utils/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({
    super.key,
    this.title = '',
  }) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.teal,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Text(
        title,
        style: AppStyling.boldText600Size18.copyWith(color: AppColors.black),
      ),
    );
  }
}
