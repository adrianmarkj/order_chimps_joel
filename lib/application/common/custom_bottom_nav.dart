import 'package:base_project/application/core/utils/app_colors.dart';
import 'package:base_project/data/models/response/auth_response.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../core/routes.dart';

class CustomBottomNav extends StatefulWidget {
  final int currentIndex;
  final AuthResponse authResponse;

  const CustomBottomNav({super.key, required this.currentIndex, required this.authResponse});

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.h),
      decoration: const BoxDecoration(color: AppColors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
              splashFactory: NoSplash.splashFactory,
              onTap: () {
                setState(() {
                  widget.currentIndex != 0
                      ? Navigator.pushReplacementNamed(context, Routes.kHomePage)
                      : null;
                });
              },
              child: Icon(
                Icons.home,
                size: 5.h,
                color: widget.currentIndex == 0
                    ? AppColors.teal
                    : AppColors.black.withOpacity(0.3),
              )),
          InkWell(
            splashFactory: NoSplash.splashFactory,
            onTap: () {
              setState(() {
                widget.currentIndex != 1
                    ? Navigator.pushReplacementNamed(context, Routes.kProfilePage, arguments: widget.authResponse)
                    : null;
              });
            },
            child: Icon(
              Icons.person,
              size: 5.h,
              color: widget.currentIndex == 1
                  ? AppColors.teal
                  : AppColors.black.withOpacity(0.3),
            ),
          )
        ],
      ),
    );
  }
}
