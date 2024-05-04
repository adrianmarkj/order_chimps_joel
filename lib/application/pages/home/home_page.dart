import 'package:base_project/application/common/custom_bottom_nav.dart';
import 'package:base_project/application/core/services/permission_manager.dart';
import 'package:base_project/application/core/utils/app_styling.dart';
import 'package:base_project/application/pages/base/base_page.dart';
import 'package:base_project/application/pages/home/bloc/home_bloc.dart';
import 'package:base_project/application/pages/home/widgets/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../injection.dart';
import '../../common/custom_app_bar.dart';
import '../base/bloc/base_bloc.dart';
import '../base/bloc/base_event.dart';
import '../base/bloc/base_state.dart';

class HomePage extends BasePage {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BasePageState<HomePage> {
  final HomeBloc bloc = sl<HomeBloc>();

  @override
  void initState() {
    super.initState();
    AppPermissionManager.requestLocationPermission(context, () {});
  }

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Home"),
      bottomNavigationBar: const CustomBottomNav(
        currentIndex: 0,
      ),
      body: BlocProvider<HomeBloc>(
        create: (_) => bloc,
        child: BlocListener<HomeBloc, BaseState<HomeState>>(
          listener: (context, state) {},
          child: Padding(
            padding: EdgeInsets.only(top: 3.h, left: 5.w, right: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Featured", style: AppStyling.boldText600Size18),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => ProductTile(
                      title: "Item Number ${index+1}",
                      price: "\$29.99",
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
