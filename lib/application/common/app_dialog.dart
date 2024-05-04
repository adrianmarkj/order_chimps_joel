import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../core/utils/app_colors.dart';

class AppDialog extends StatelessWidget {
  final String title;
  final String? description;
  final Color? descriptionColor;
  final String? subDescription;
  final Color? subDescriptionColor;
  final String? positiveButtonText;
  final String? negativeButtonText;
  final VoidCallback? onPositiveCallback;
  final VoidCallback? onNegativeCallback;
  final Widget? dialogContentWidget;
  final bool? expandPos;

  final bool? isSessionTimeout;

  const AppDialog(
      {super.key,
      required this.title,
      this.description,
      this.descriptionColor,
      this.subDescription,
      this.subDescriptionColor,
      this.onPositiveCallback,
      this.onNegativeCallback,
      this.positiveButtonText,
      this.negativeButtonText,
      this.dialogContentWidget,
      this.isSessionTimeout,
      this.expandPos = false});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Container(
            alignment: FractionalOffset.center,
            padding: const EdgeInsets.all(24),
            child: Wrap(
              children: [
                Material(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: AppColors.black),
                          ),
                          dialogContentWidget != null
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12, left: 9, right: 9),
                                  child: dialogContentWidget,
                                )
                              : const SizedBox(),
                          description != null
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 12),
                                  child: Text(
                                    description ?? "",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: descriptionColor ??
                                            AppColors.black),
                                  ),
                                )
                              : const SizedBox(),
                          subDescription != null
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 16),
                                  child: Text(
                                    subDescription ?? "",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: subDescriptionColor ??
                                            AppColors.black),
                                  ),
                                )
                              : const SizedBox(),
                          Padding(
                            padding: EdgeInsets.only(top: 2.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 30.w,
                                  padding: EdgeInsets.all(1.h),
                                  color: AppColors.teal,
                                  child: InkWell(
                                    child: const Center(child: Text("OK")),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
