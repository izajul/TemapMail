class AccountFailed {
  String context;
  String type;
  String hydraTitle;
  String hydraDescription;
  List<Violations> violations;

  AccountFailed(this.context, this.type, this.hydraTitle, this.hydraDescription,
      this.violations);

  factory AccountFailed.fromJson(Map<String, dynamic> json) {
    List<Violations> v = [];

    if (json['violations'] != null) {
      json['violations'].forEach((v) {
        v.add(Violations.fromJson(v));
      });
    }

    return AccountFailed(json['@context'], json['@type'], json['hydra:title'],
        json['hydra:description'], v);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['@context'] = context;
    data['@type'] = type;
    data['hydra:title'] = hydraTitle;
    data['hydra:description'] = hydraDescription;
    data['violations'] = violations.map((v) => v.toJson()).toList();
    return data;
  }
}

class Violations {
  String propertyPath;
  String message;
  String code;

  Violations(this.propertyPath, this.message, this.code);

  factory Violations.fromJson(Map<String, dynamic> json) =>
      Violations(json['propertyPath'], json['message'], json['code']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['propertyPath'] = propertyPath;
    data['message'] = message;
    data['code'] = code;
    return data;
  }
}
