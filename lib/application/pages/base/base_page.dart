import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../error/messages.dart';
import '../../common/app_dialog.dart';
import '../../core/utils/app_colors.dart';
import 'bloc/base_bloc.dart';
import 'bloc/base_state.dart';

abstract class BasePage extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);
}

abstract class BasePageState<Page extends BasePage> extends State<Page> {
  bool _isProgressShow = false;
  bool isRealDevice = true,
      isRealDevice2 = true,
      isJailBroken = false,
      isRoot = false,
      isRoot2 = false,
      isADBEnabled = false;

  // Abstract Methods
  Widget buildView(BuildContext context);

  Base? getBloc();

  void showAppDialog(
      {required String title,
        String? message,
        Color? messageColor,
        String? subDescription,
        Color? subDescriptionColor,
        String? positiveButtonText,
        String? negativeButtonText,
        VoidCallback? onPositiveCallback,
        VoidCallback? onNegativeCallback,
        Widget? dialogContentWidget,
        bool shouldDismiss = false,
        bool? shouldEnableClose,
        bool isSessionTimeout = false,
        bool? expandPos = false}) {
    showGeneralDialog(
        context: context,
        barrierDismissible: shouldDismiss,
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: AppDialog(
                title: title,
                description: message,
                descriptionColor: messageColor,
                subDescription: subDescription,
                subDescriptionColor: subDescriptionColor,
                positiveButtonText: positiveButtonText,
                negativeButtonText: negativeButtonText,
                onNegativeCallback: onNegativeCallback,
                onPositiveCallback: onPositiveCallback,
                dialogContentWidget: dialogContentWidget,
                isSessionTimeout: isSessionTimeout,
                expandPos: expandPos,
              ),
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 250),
        pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
          return const SizedBox.shrink();
        });
  }

  void showProgress() {
    if (!_isProgressShow) {
      _isProgressShow = true;
      showGeneralDialog(
          context: context,
          barrierDismissible: false,
          transitionBuilder: (context, a1, a2, widget) {
            return PopScope(
              canPop: false,
              child: Transform.scale(
                scale: a1.value,
                child: Opacity(
                  opacity: a1.value,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                    child: Container(
                      alignment: FractionalOffset.center,
                      child: Wrap(
                        children: [
                          Container(
                            color: Colors.transparent,
                            child: const SpinKitWave(
                              color: AppColors.primaryBlue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          transitionDuration: const Duration(milliseconds: 200),
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return const SizedBox.shrink();
          });
    }
  }

  void hideProgressBar() {
    if (_isProgressShow) {
      Navigator.pop(context);
      _isProgressShow = false;
    }
  }

  @override
  void initState(){
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getBloc()!,
      child: BlocListener<Base, BaseState>(
        bloc: getBloc(),
        listener: (context, state) {
          if (state is APILoadingState) {
            showProgress();
          } else if (state is SessionExpireState) {
            hideProgressBar();
            showAppDialog(title: ErrorHandler.TITLE_OOPS, message: state.error, onPositiveCallback: () {});
          } else {
            hideProgressBar();
            if (state is APIFailureState) {
              showAppDialog(title: ErrorHandler.TITLE_OOPS, message: state.error, onPositiveCallback: () {});
            }
          }
        },
        child: buildView(context),
        ),
      );
  }
}
