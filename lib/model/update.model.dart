class Update {
  String context;
  String id;
  String type;
  bool seen;

  Update(this.context, this.id, this.type, this.seen);

  factory Update.fromJson(Map<String, dynamic> json) =>
      Update(json['@context'], json['@id'], json['@type'], json['seen']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['@context'] = context;
    data['@id'] = id;
    data['@type'] = type;
    data['seen'] = seen;
    return data;
  }
}
