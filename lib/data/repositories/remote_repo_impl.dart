

import 'package:base_project/data/models/request/auth_request.dart';

import 'package:base_project/data/models/response/auth_response.dart';

import 'package:base_project/domain/failures/failures.dart';

import 'package:dartz/dartz.dart';

import '../../application/core/network/network_info.dart';
import '../../domain/repositories/remote_repo.dart';
import '../../error/exceptions.dart';
import '../../error/messages.dart';
import '../datasources/remote_datasource.dart';
import '../models/common/common_error_response.dart';

class RemoteRepoImpl implements RemoteRepo {
  final RemoteDatasource remoteDatasource;
  final NetworkInfo networkInfo;

  RemoteRepoImpl({required this.remoteDatasource, required this.networkInfo});

  @override
  Future<Either<Failure, AuthResponse>> authenticate(AuthRequest authRequest) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDatasource.authenticate(authRequest);
        return Right(response.data!);
      } on ServerException catch (ex) {
        return Left(ServerFailure(ex.errorResponseModel));
      } on APIFailException catch (ex) {
        return Left(APIFailure(ex.errorResponseModel));
      } on UnAuthorizedException catch (ex) {
        return Left(AuthorizedFailure(ex.errorResponseModel));
      } on DioExceptionError catch (e) {
        return Left(ServerFailure(e.errorResponseModel));
      } on Exception {
        return Left(
          ServerFailure(
            ErrorResponseModel(responseError: ErrorHandler.ERROR_SOMETHING_WENT_WRONG, responseCode: ''),
          ),
        );
      }
    } else {
      return Left(ConnectionFailure());
    }
  }
}
