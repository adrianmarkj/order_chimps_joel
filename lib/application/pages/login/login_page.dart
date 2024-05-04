import 'package:base_project/application/common/app_button.dart';
import 'package:base_project/application/common/app_text_field.dart';
import 'package:base_project/application/core/utils/app_styling.dart';
import 'package:base_project/application/pages/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../error/messages.dart';
import '../../../injection.dart';
import '../../core/routes.dart';
import '../../core/utils/app_colors.dart';
import '../base/base_page.dart';
import '../base/bloc/base_bloc.dart';
import '../base/bloc/base_event.dart';
import '../base/bloc/base_state.dart';

class LoginPage extends BasePage {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BasePageState<LoginPage> {
  final LoginBloc bloc = sl<LoginBloc>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  
  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: false,
      body: BlocProvider<LoginBloc>(
        create: (_) => bloc,
        child: BlocListener<LoginBloc, BaseState<LoginState>>(
          listener: (_, state) {
            if (state is AuthSuccessState) {
              Navigator.pushReplacementNamed(context, Routes.kHomePage, arguments: state.authResponse);
            } else if (state is AuthFailState) {
            }
          },
          child: Padding(
            padding:
                EdgeInsets.only(top: 10.h, left: 5.w, right: 5.w, bottom: 3.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 3.h, vertical: 1.5.h),
                  decoration: const BoxDecoration(
                      color: AppColors.teal,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Text(
                    "E",
                    style: AppStyling.bold700TextSize20
                        .copyWith(color: AppColors.white),
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  "Welcome to Eridanus",
                  style: AppStyling.bold700TextSize20
                      .copyWith(color: AppColors.teal),
                ),
                Text(
                  "Login to continue shopping.",
                  style: AppStyling.normal400TextSize14
                      .copyWith(color: AppColors.black),
                ),
                SizedBox(
                  height: 6.h,
                ),
                AppTextField(
                  hint: "username",
                  labelText: "Username/Email",
                  controller: usernameController,
                ),
                SizedBox(
                  height: 3.h,
                ),
                AppTextField(
                  hint: "password",
                  labelText: "Password",
                  obscureText: true,
                  controller: passwordController,
                ),
                SizedBox(
                  height: 5.h,
                ),
                AppButton(
                  labelText: "LOGIN",
                  shadow: true,
                  onTap: (){
                    if(validate()){
                      bloc.add(Authenticate(
                          username: usernameController.text, password: passwordController.text));
                    }
                  },
                ),
                const Spacer(),
                Center(
                  child: Text.rich(
                    TextSpan(
                      text: "Don't have an account?",
                      style: AppStyling.normal400TextSize12
                          .copyWith(color: AppColors.black.withOpacity(0.5)),
                      children: [
                        TextSpan(
                            text: " Sign up",
                            style: AppStyling.normal400TextSize12
                                .copyWith(color: AppColors.teal)),
                        const TextSpan(
                          text: ".",
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool validate() {
    if (usernameController.text.isEmpty) {
      showAppDialog(title: ErrorHandler.TITLE_OOPS, message: 'Username/Email cannot be empty');
      return false;
    }

    if (passwordController.text.isEmpty) {
      showAppDialog(title: ErrorHandler.TITLE_OOPS, message: 'Password cannot be empty');
      return false;
    }

    return true;
  }

  @override
  Base<BaseEvent, BaseState>? getBloc() => bloc;
}
