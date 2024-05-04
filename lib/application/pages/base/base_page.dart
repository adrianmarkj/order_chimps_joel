import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../core/utils/app_colors.dart';
import 'cubit/base_bloc.dart';
import 'cubit/base_state.dart';

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
          } else {
            hideProgressBar();
            if (state is APIFailureState) {}
          }
        },
        child: buildView(context),
        ),
      );
  }
}
