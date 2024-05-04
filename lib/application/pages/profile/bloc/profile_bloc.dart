import 'package:flutter/material.dart';

import '../../base/bloc/base_bloc.dart';
import '../../base/bloc/base_event.dart';
import '../../base/bloc/base_state.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Base<ProfileEvent, BaseState<ProfileState>> {

  ProfileBloc()
      : super(ProfileInitial()) {
    // on<MobileNumberValidateEvent>(_validateMobileNumber);
  }
}