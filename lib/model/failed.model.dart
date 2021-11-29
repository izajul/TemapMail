class Failed {
  String context;
  String type;
  String hydraTitle;
  String hydraDescription;

  Failed(this.context, this.type, this.hydraTitle, this.hydraDescription);

  factory Failed.fromJson(Map<String, dynamic> json) => Failed(json['@context'],
      json['@type'], json['hydra:title'], json['hydra:description']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['@context'] = context;
    data['@type'] = type;
    data['hydra:title'] = hydraTitle;
    data['hydra:description'] = hydraDescription;
    return data;
  }
}
