
import 'package:base_project/data/models/request/auth_request.dart';
import 'package:base_project/data/models/response/auth_response.dart';
import 'package:dartz/dartz.dart';

import '../failures/failures.dart';

abstract class RemoteRepo {
  Future<Either<Failure, AuthResponse>> authenticate(
      AuthRequest authRequest);
}
