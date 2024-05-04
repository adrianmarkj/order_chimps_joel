import 'package:flutter/material.dart';

import '../../base/bloc/base_bloc.dart';
import '../../base/bloc/base_event.dart';
import '../../base/bloc/base_state.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Base<HomeEvent, BaseState<HomeState>> {

  HomeBloc()
      : super(HomeInitial()) {
    // on<MobileNumberValidateEvent>(_validateMobileNumber);
  }
}