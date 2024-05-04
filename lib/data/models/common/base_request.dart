class BaseRequest {
  BaseRequest({
    this.data,
  });

  String? data;

  factory BaseRequest.fromJson(Map<String, dynamic> json) => BaseRequest(
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "data": data,
  };
}