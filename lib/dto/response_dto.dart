class ResponseDTO {
  final int? code;
  final String? msg;
  String? token;
  dynamic data; // JsonArray [], JsonObject {}
  // dynamic 쓰는 이유 : 처음에 받을 때 map으로 줌 -> 나중에 타입 지정하면 바꾸기 힘들기 때문에

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
