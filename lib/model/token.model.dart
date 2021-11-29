class JWTTokenModel {
  String? token;
  String? id;
  int? code;
  String? message;

  JWTTokenModel({this.token, this.id, this.code, this.message});

  factory JWTTokenModel.fromJson(Map<String, dynamic> json) => JWTTokenModel(
      token: json['token'],
      id: json['id'],
      code: json['code'],
      message: json['message']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['id'] = id;
    data['code'] = code;
    data['message'] = message;
    return data;
  }
}
