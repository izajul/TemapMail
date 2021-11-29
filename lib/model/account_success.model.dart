class AccountSuccess {
  String context;
  String $id;
  String type;
  String id;
  String address;
  int quota;
  int used;
  bool isDisabled;
  bool isDeleted;
  String createdAt;
  String updatedAt;

  AccountSuccess(
      this.context,
      this.$id,
      this.type,
      this.id,
      this.address,
      this.quota,
      this.used,
      this.isDisabled,
      this.isDeleted,
      this.createdAt,
      this.updatedAt);

  factory AccountSuccess.fromJson(Map<String, dynamic> json) => AccountSuccess(
      json['@context'],
      json['@id'],
      json['@type'],
      json['id'],
      json['address'],
      json['quota'],
      json['used'],
      json['isDisabled'],
      json['isDeleted'],
      json['createdAt'],
      json['updatedAt']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['@context'] = context;
    data['@id'] = $id;
    data['@type'] = type;
    data['id'] = id;
    data['address'] = address;
    data['quota'] = quota;
    data['used'] = used;
    data['isDisabled'] = isDisabled;
    data['isDeleted'] = isDeleted;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
