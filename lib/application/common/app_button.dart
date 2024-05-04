import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../core/utils/app_colors.dart';

class AppButton extends StatefulWidget {
  final String labelText;
  final bool? shadow;
  const AppButton({super.key, required this.labelText, this.shadow = false});

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 1.5.h),
      decoration: BoxDecoration(
        color: AppColors.teal,
        borderRadius: const BorderRadius.all(Radius.circular(3)),
        boxShadow: widget.shadow! ? [
          BoxShadow(
            color: AppColors.black.withOpacity(0.2),
            offset: const Offset(0, 7),
            spreadRadius: 1,
            blurRadius: 15,
          )
        ] : []
      ),
      child: Center(
        child: Text(widget.labelText, style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w700,
          color: AppColors.white
        ),),
      ),
    );
  }
}
