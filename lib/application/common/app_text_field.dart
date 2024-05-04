import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import '../core/utils/app_colors.dart';
import '../core/utils/app_validator.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController? controller;
  final Widget? icon;
  final Widget? action;
  final String? hint;
  final String? errorMessage;
  final Function(String)? onTextChanged;
  final TextInputType? inputType;
  final bool? isEnable;
  final int? maxLength;
  final String? labelText;
  final bool? obscureText;
  final bool? shouldRedirectToNextField;
  final String? regex;
  final int? maxLines;
  final bool? isCurrency;
  final FocusNode? focusNode;
  final Function(String)? onSubmit;
  final Function? onTap;
  final bool? isLabel;
  final double? fontSize;
  final List<TextInputFormatter>? inputFormatter;
  final bool isUnderline;

  const AppTextField({super.key,
    this.controller,
    this.icon,
    this.action,
    required this.hint,
    required this.labelText,
    this.errorMessage,
    this.maxLength = 50,
    this.maxLines = 1,
    this.onTextChanged,
    this.inputType,
    this.regex,
    this.focusNode,
    this.onSubmit,
    this.isEnable = true,
    this.obscureText = false,
    this.isCurrency = false,
    this.shouldRedirectToNextField = true,
    this.isLabel = false,
    this.onTap,
    this.fontSize,
    this.inputFormatter,
    this.isUnderline = true,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  double borderRadius = 5;
  Widget? action;

  TextEditingController? controller;

  @override
  void initState() {
    super.initState();
    setState(() {
      action = widget.action;
      if(widget.controller==null){
        controller = TextEditingController();
      }else{
        controller = widget.controller;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.labelText!, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 10.sp, color: AppColors.black.withOpacity(0.8)),),
        TextField(
          enableInteractiveSelection: false,
          onTap: () {
            if (widget.onTap != null) widget.onTap!();
          },
          onChanged: (text) {
            setState(() {
              if (widget.regex != null && text.isEmpty) {
                setState(() {
                  action = null;
                });
              } else {
                if (widget.regex != null && widget.regex!.isNotEmpty) {
                  if (RegExp(widget.regex!).hasMatch(text)) {
                    setState(() {
                      action = const Icon(
                        CupertinoIcons.checkmark_circle_fill,
                        color: AppColors.success,
                      );
                    });
                  } else {
                    setState(() {
                      action = const Icon(
                        CupertinoIcons.multiply_circle_fill,
                        color: AppColors.fail,
                      );
                    });
                  }
                }
              }
            });

            if (widget.onTextChanged != null) {
              widget.onTextChanged!(text);
            }
          },
          onSubmitted: (value) {
            if (widget.onSubmit != null) widget.onSubmit!(value);
          },
          focusNode: widget.focusNode,
          autofocus: false,
          controller: controller,
          obscureText: widget.obscureText!,
          obscuringCharacter: '●',
          textInputAction: widget.shouldRedirectToNextField!
              ? TextInputAction.next
              : TextInputAction.done,
          enabled: widget.isEnable,
          maxLines: widget.maxLines,
          textCapitalization: TextCapitalization.sentences,
          maxLength: widget.maxLength,
          inputFormatters: [
            if (widget.inputFormatter != null) ...widget.inputFormatter!,
            FilteringTextInputFormatter.deny(
              RegExp(Validator().emojiRegexp),
            ),
          ],
          style: TextStyle(
            fontSize: widget.fontSize ?? (widget.obscureText! ? 20 : 14),
            fontWeight: FontWeight.bold,
            letterSpacing: widget.obscureText! ? 0.0 : 0.0,
          ),
          keyboardType: widget.inputType ?? TextInputType.text,
          decoration: InputDecoration(
            labelText: widget.isLabel == true ? widget.hint : null,
            labelStyle: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.0,
              color: AppColors.black,
            ),
            floatingLabelStyle: TextStyle(
                fontSize: 14.sp,
                color: AppColors.black,
                fontWeight: FontWeight.w400),
            contentPadding: EdgeInsets.only(bottom: 1.h, top: 0.5.h),
            isDense: true,
            errorText: widget.errorMessage,
            counterText: "",
            enabledBorder: widget.isUnderline
                ? const UnderlineInputBorder(
              borderSide:
              BorderSide(color: AppColors.black, width: 1.0),
            )
                : InputBorder.none,
            focusedBorder: widget.isUnderline
                ? const UnderlineInputBorder(
              borderSide:
              BorderSide(color: AppColors.black, width: 1.0),
            )
                : InputBorder.none,
            border: widget.isUnderline
                ? const UnderlineInputBorder(
              borderSide:
              BorderSide(color: AppColors.black, width: 1.0),
            )
                : InputBorder.none,
            prefixIcon: widget.icon,
            prefixIconConstraints: const BoxConstraints(
              minWidth: 55,
            ),
            suffixIcon: action,
            filled: true,
            hintText: widget.isLabel == false ? widget.hint : null,
            hintStyle: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.0,
              color: AppColors.black.withOpacity(0.5)
            ),
            fillColor: Colors.white,
          ),
        ),
      ],
    );
  }
}


