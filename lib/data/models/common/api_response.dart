
import '../../../application/core/encryption/packet_header.dart';

class APIResponse<T> {
  APIResponse({this.header, this.data});
  PacketHeader? header;
  T? data;

  factory APIResponse.fromJson(Map<String, dynamic> json, {Function(Map<String, dynamic>)? payload}) => APIResponse(
    header: json["header"] != null ? PacketHeader.fromJson(json["header"]) : PacketHeader(),
    data: payload != null ? payload(json) : '',
  );
}