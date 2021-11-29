class SearchModel {
  String context;
  String id;
  String type;
  List<HydraMember> hydraMember;
  int hydraTotalItems;

  SearchModel(
      this.context, this.id, this.type, this.hydraMember, this.hydraTotalItems);

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    List<HydraMember> hyd = [];
    if (json['hydra:member'] != null) {
      json['hydra:member'].forEach((v) {
        hyd.add(HydraMember.fromJson(v));
      });
    }

    return SearchModel(json['@context'], json['@id'], json['@type'], hyd,
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
  String domain;
  bool isActive;
  bool isPrivate;
  String createdAt;
  String updatedAt;

  HydraMember(this.$id, this.type, this.id, this.domain, this.isActive,
      this.isPrivate, this.createdAt, this.updatedAt);

  factory HydraMember.fromJson(Map<String, dynamic> json) => HydraMember(
      json['@id'],
      json['@type'],
      json['id'],
      json['domain'],
      json['isActive'],
      json['isPrivate'],
      json['createdAt'],
      json['updatedAt']);

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['@id'] = $id;
    data['@type'] = type;
    data['id'] = id;
    data['domain'] = domain;
    data['isActive'] = isActive;
    data['isPrivate'] = isPrivate;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
