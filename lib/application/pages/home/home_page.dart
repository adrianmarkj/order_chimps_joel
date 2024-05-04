import 'package:base_project/application/pages/base/base_page.dart';
import 'package:base_project/application/pages/base/cubit/base_bloc.dart';
import 'package:base_project/application/pages/base/cubit/base_event.dart';
import 'package:base_project/application/pages/base/cubit/base_state.dart';
import 'package:flutter/material.dart';

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
