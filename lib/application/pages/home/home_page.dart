import 'package:base_project/application/pages/base/base_page.dart';
import 'package:base_project/application/pages/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';

import '../../../injection.dart';
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
  Widget buildView(BuildContext context) {
    return const Placeholder();
  }

  @override
  Base<BaseEvent, BaseState>? getBloc() => bloc;
}
