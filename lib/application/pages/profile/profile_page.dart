import 'package:base_project/application/common/app_button.dart';
import 'package:base_project/application/common/custom_bottom_nav.dart';
import 'package:base_project/application/core/utils/app_colors.dart';
import 'package:base_project/application/pages/base/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../injection.dart';
import '../../common/custom_app_bar.dart';
import '../base/bloc/base_bloc.dart';
import '../base/bloc/base_event.dart';
import '../base/bloc/base_state.dart';
import 'bloc/profile_bloc.dart';

class ProfilePage extends BasePage {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends BasePageState<ProfilePage> {
  final ProfileBloc bloc = sl<ProfileBloc>();

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Profile"),
      bottomNavigationBar: const CustomBottomNav(
        currentIndex: 1,
      ),
      body: BlocProvider<ProfileBloc>(
        create: (_) => bloc,
        child: BlocListener<ProfileBloc, BaseState<ProfileState>>(
          listener: (context, state) {},
          child: Padding(
            padding: EdgeInsets.only(left: 5.w, right: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 3.h,),
                 Center(
                   child: CircleAvatar(
                    radius: 6.h,
                    backgroundImage: const NetworkImage("https://i.pravatar.cc/300"),
                                   ),
                 ),
                const Spacer(),
                const AppButton(labelText: "Logout", color: AppColors.fail,)
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
