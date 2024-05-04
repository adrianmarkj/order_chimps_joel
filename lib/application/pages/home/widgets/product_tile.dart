import 'package:base_project/application/core/utils/app_colors.dart';
import 'package:base_project/application/core/utils/app_styling.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProductTile extends StatelessWidget {
  final String title;
  final String img;
  final String price;

  const ProductTile(
      {super.key, required this.title, required this.price, required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 1.h, top: 3.h),
      padding: EdgeInsets.only(bottom: 3.h),
      decoration:
          const BoxDecoration(border: Border(bottom: BorderSide(width: 1))),
      child: Row(
        children: [
          SizedBox(
            height: 15.h,
            width: 15.h,
            child: const Placeholder(),
          ),
          SizedBox(width: 10.w,),
          Column(
            children: [
              Text(title, style: AppStyling.bold500TextSize14,),
              Text("\$$price", style: AppStyling.normal400TextSize12.copyWith(color: AppColors.teal),)
            ],
          )
        ],
      ),
    );
  }
}
