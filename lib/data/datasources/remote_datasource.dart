import 'dart:async';

import 'package:base_project/data/models/request/auth_request.dart';
import 'package:base_project/data/models/response/auth_response.dart';

import '../../application/core/encryption/packet_header.dart';
import '../../application/core/network/api_helper.dart';
import '../models/common/api_request.dart';
import '../models/common/api_response.dart';

abstract class RemoteDatasource {
  Future<APIResponse<AuthResponse>> authenticate(
      AuthRequest authRequest);
}

class RemoteDataSourceImpl implements RemoteDatasource {
  final APIHelper apiHelper;

  Future<PacketHeader> _generateHeader() async {
    PacketHeader header = PacketHeader();
    header.tZ = "Europe/London";
    return header;
  }

  RemoteDataSourceImpl({required this.apiHelper});

  @override
  Future<APIResponse<AuthResponse>> authenticate(
      AuthRequest authRequest) async {
    try {
      final request = APIRequest<AuthRequest>();
      request.header = await _generateHeader();
      request.body = authRequest;
      final response = await apiHelper.post(
        "https://api.in2dfuture.com/api/v2/auth/login",
        body: request.body?.toJson(),
      );
      return APIResponse<AuthResponse>.fromJson(
        response,
        payload: (data) => AuthResponse.fromJson(data),
      );
    } on Exception {
      rethrow;
    }
  }
}
