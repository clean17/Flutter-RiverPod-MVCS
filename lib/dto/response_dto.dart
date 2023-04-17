class ResponseDTO {
  final int? code;
  final String? msg;
  String? token;
  dynamic data; // JsonArray [], JsonObject {} // 자유롭게 받아준다.

  ResponseDTO({
    this.code,
    this.msg,
    this.data,
  });

  ResponseDTO.fromJson(Map<String, dynamic> json)
      : code = json["code"],
        msg = json["msg"],
        data = json["data"];
}
