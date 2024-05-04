import 'package:base_project/application/common/app_button.dart';
import 'package:base_project/application/common/app_text_field.dart';
import 'package:base_project/application/core/utils/app_styling.dart';
import 'package:base_project/application/pages/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../injection.dart';
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
  
  @override
  void initState(){
    super.initState();
    bloc.add(Authenticate(username: "qaapp2@yopmail.com", password: "12345678"));
  }

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocProvider<LoginBloc>(
        create: (_) => bloc,
        child: BlocListener<LoginBloc, BaseState<LoginState>>(
          listener: (_, state) {
            if (state is AuthSuccessState){
              print("Success");
            } else if (state is AuthFailState){
              print("Fail");
            }
          },
          child: Padding(
            padding: EdgeInsets.only(top: 10.h, left: 5.w, right: 5.w, bottom: 3.h),
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
                const AppTextField(
                  hint: "username",
                  labelText: "Username/Email",
                ),
                SizedBox(
                  height: 3.h,
                ),
                const AppTextField(
                  hint: "password",
                  labelText: "Password",
                  obscureText: true,
                ),
                SizedBox(
                  height: 5.h,
                ),
                const AppButton(
                  labelText: "LOGIN",
                  shadow: true,
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

  @override
  Base<BaseEvent, BaseState>? getBloc() => bloc;
}
