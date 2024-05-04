import 'package:base_project/domain/repositories/remote_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../data/models/request/auth_request.dart';
import '../../../data/models/response/auth_response.dart';
import '../../failures/failures.dart';
import '../usecase.dart';

class AuthUseCase
    extends UseCase<AuthResponse, AuthRequest> {
  final RemoteRepo repository;

  AuthUseCase({required this.repository});

  @override
  Future<Either<Failure, AuthResponse>> call(
      AuthRequest params) async {
    return await repository.authenticate(params);
  }
}