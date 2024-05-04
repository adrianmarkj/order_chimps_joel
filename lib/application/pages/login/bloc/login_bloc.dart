import 'package:base_project/data/models/request/auth_request.dart';
import 'package:base_project/data/models/response/auth_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/failures/failures.dart';
import '../../../../domain/usecases/login/authenticate.dart';
import '../../../../error/messages.dart';
import '../../base/bloc/base_bloc.dart';
import '../../base/bloc/base_event.dart';
import '../../base/bloc/base_state.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Base<LoginEvent, BaseState<LoginState>> {
  final AuthUseCase auth;

  LoginBloc({
    required this.auth
})
      : super(LoginInitial()) {
    on<Authenticate>(_authenticate);
  }

  Future<void> _authenticate(Authenticate event,
      Emitter<BaseState<LoginState>> emit) async {
    emit(APILoadingState());
    final result = await auth(
      AuthRequest(email: event.username, password: event.password, rememberMe: 1, systemUser: 1),
    );
    emit(result.fold((l) {
      if (l is AuthorizedFailure) {
        return SessionExpireState(error: l.errorResponse.responseError);
      } else if (l is APIFailure) {
        return APIFailureState(error: l.errorResponse.responseError);
      } else {
        return AuthFailState(
            error: ErrorHandler().mapFailureToMessage(l));
      }
    }, (r) {
      return AuthSuccessState(
          authResponse: r);
    }));
  }
}