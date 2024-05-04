class BaseResponse {
  BaseResponse({
    this.data,
    this.code,
    this.errorMessage,
  });

  String? data;
  int? code;
  String? errorMessage;

  factory BaseResponse.fromJson(Map<String, dynamic> json) => BaseResponse(
    data: json["data"],
    code: json["code"],
    errorMessage: json["error_message"],
  );

  Map<String, dynamic> toJson() => {
    "data": data,
    "code": code,
    "error_message": errorMessage,
  };
}