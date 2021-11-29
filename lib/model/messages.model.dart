class MessagesModel {
  String context;
  String id;
  String type;
  List<HydraMember> hydraMember;
  int hydraTotalItems;

  MessagesModel(
      this.context, this.id, this.type, this.hydraMember, this.hydraTotalItems);

  factory MessagesModel.fromJson(Map<String, dynamic> json) {
    List<HydraMember> list = [];
    if (json['hydra:member'] != null) {
      json['hydra:member'].forEach((v) {
        list.add(HydraMember.fromJson(v));
      });
    }
    return MessagesModel(json['@context'], json['@id'], json['@type'], list,
        json['hydra:totalItems']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['@context'] = context;
    data['@id'] = id;
    data['@type'] = type;
    data['hydra:member'] = hydraMember.map((v) => v.toJson()).toList();
    data['hydra:totalItems'] = hydraTotalItems;
    return data;
  }
}

class HydraMember {
  String $id;
  String type;
  String id;
  String accountId;
  String msgid;
  From from;
  List<To> to;
  String subject;
  String intro;
  bool seen;
  bool isDeleted;
  bool hasAttachments;
  int size;
  String downloadUrl;
  String createdAt;
  String updatedAt;

  HydraMember(
      this.$id,
      this.type,
      this.id,
      this.accountId,
      this.msgid,
      this.from,
      this.to,
      this.subject,
      this.intro,
      this.seen,
      this.isDeleted,
      this.hasAttachments,
      this.size,
      this.downloadUrl,
      this.createdAt,
      this.updatedAt);

  factory HydraMember.fromJson(Map<String, dynamic> json) {
    List<To> list = [];

    if (json['to'] != null) {
      json['to'].forEach((v) {
        list.add(To.fromJson(v));
      });
    }

    return HydraMember(
        json['@id'],
        json['@type'],
        json['id'],
        json['accountId'],
        json['msgid'],
        From.fromJson(json['from']),
        list,
        json['subject'],
        json['intro'],
        json['seen'],
        json['isDeleted'],
        json['hasAttachments'],
        json['size'],
        json['downloadUrl'],
        json['createdAt'],
        json['updatedAt']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['@id'] = $id;
    data['@type'] = type;
    data['id'] = id;
    data['accountId'] = accountId;
    data['msgid'] = msgid;
    data['from'] = from.toJson();
    data['to'] = to.map((v) => v.toJson()).toList();
    data['subject'] = subject;
    data['intro'] = intro;
    data['seen'] = seen;
    data['isDeleted'] = isDeleted;
    data['hasAttachments'] = hasAttachments;
    data['size'] = size;
    data['downloadUrl'] = downloadUrl;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class From {
  String address;
  String name;

  From(this.address, this.name);

  factory From.fromJson(Map<String, dynamic> json) =>
      From(json['address'], json['name']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['name'] = name;
    return data;
  }
}

class To {
  String address;
  String name;

  To(this.address, this.name);

  factory To.fromJson(Map<String, dynamic> json) =>
      To(json['address'], json['name']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['name'] = name;
    return data;
  }
}
