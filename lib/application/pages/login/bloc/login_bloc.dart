import 'package:flutter/material.dart';

import '../../base/bloc/base_bloc.dart';
import '../../base/bloc/base_event.dart';
import '../../base/bloc/base_state.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Base<LoginEvent, BaseState<LoginState>> {

  LoginBloc()
      : super(LoginInitial()) {
    // on<MobileNumberValidateEvent>(_validateMobileNumber);
  }
}