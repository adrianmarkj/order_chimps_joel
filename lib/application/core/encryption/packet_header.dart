class PacketHeader {
  PacketHeader({
    this.tZ,
  });

  String? tZ;

  factory PacketHeader.fromJson(Map<String, dynamic> json) => PacketHeader(
    tZ: json["Tz"],
  );

  Map<String, dynamic> toJson() => {
    "Tz": tZ,
  };
}
