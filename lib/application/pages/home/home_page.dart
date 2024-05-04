import 'package:base_project/application/pages/base/base_page.dart';
import 'package:flutter/material.dart';

import '../base/bloc/base_bloc.dart';
import '../base/bloc/base_event.dart';
import '../base/bloc/base_state.dart';

class HomePage extends BasePage {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BasePageState<HomePage> {

  @override
  Widget buildView(BuildContext context) {
    // TODO: implement buildView
    throw UnimplementedError();
  }

  @override
  Base<BaseEvent, BaseState>? getBloc() {
    // TODO: implement getBloc
    throw UnimplementedError();
  }
}
