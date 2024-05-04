import '../../../application/core/encryption/packet_header.dart';

abstract class Serializable {
  Map<String, dynamic> toJson();
}

class APIRequest<T extends Serializable>{
  APIRequest({
    this.header,
    this.body,
  });

  PacketHeader? header;
  T? body;

  Map<String, dynamic> toJson() => {
    "header": header?.toJson(),
    "body": body!=null?body!.toJson():'',
  };
}