import 'messages.model.dart';

class MessagesDetails {
  String context;
  String $id;
  String type;
  String id;
  String accountId;
  String msgid;
  From from;
  List<To> to;
  List<CC> cc;
  var bcc;
  String subject;
  bool seen;
  bool flagged;
  bool isDeleted;
  var verifications;
  bool retention;
  String retentionDate;
  String text;
  List<String> html;
  bool hasAttachments;
  List<Attachment> attachments;
  int size;
  String downloadUrl;
  String createdAt;
  String updatedAt;

  MessagesDetails(
      this.context,
      this.$id,
      this.type,
      this.id,
      this.accountId,
      this.msgid,
      this.from,
      this.to,
      this.cc,
      this.bcc,
      this.subject,
      this.seen,
      this.flagged,
      this.isDeleted,
      this.verifications,
      this.retention,
      this.retentionDate,
      this.text,
      this.html,
      this.hasAttachments,
      this.attachments,
      this.size,
      this.downloadUrl,
      this.createdAt,
      this.updatedAt);

  factory MessagesDetails.fromJson(Map<String, dynamic> json) {
    List<CC> cc = [];
    if (json['cc'] != null) {
      json['cc'].forEach((v) {
        cc.add(CC.fromJson(v));
      });
    }
    List<To> t = [];
    if (json['to'] != null) {
      json['to'].forEach((v) {
        t.add(To.fromJson(v));
      });
    }
    List<Attachment> att = [];
    if (json['attachments'] != null) {
      json['attachments'].forEach((v) {
        att.add(Attachment.fromJson(v));
      });
    }

    return MessagesDetails(
      json['@context'],
      json['@id'],
      json['@type'],
      json['id'],
      json['accountId'],
      json['msgid'],
      From.fromJson(json['from']),
      t,
      cc,
      null,
      json['subject'],
      json['seen'],
      json['flagged'],
      json['isDeleted'],
      null,
      json['retention'],
      json['retentionDate'],
      json['text'],
      json['html'].cast<String>(),
      json['hasAttachments'],
      att,
      json['size'],
      json['downloadUrl'],
      json['createdAt'],
      json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['@context'] = context;
    data['@id'] = id;
    data['@type'] = type;
    data['id'] = id;
    data['accountId'] = accountId;
    data['msgid'] = msgid;
    data['from'] = from.toJson();
    data['to'] = to.map((v) => v.toJson()).toList();
    data['cc'] = cc.map((v) => v.toJson()).toList();
    if (bcc != null) {
      data['bcc'] = bcc.map((v) => v.toJson()).toList();
    }
    data['subject'] = subject;
    data['seen'] = seen;
    data['flagged'] = flagged;
    data['isDeleted'] = isDeleted;
    if (verifications != null) {
      data['verifications'] = verifications.map((v) => v.toJson()).toList();
    }
    data['retention'] = retention;
    data['retentionDate'] = retentionDate;
    data['text'] = text;
    data['html'] = html;
    data['hasAttachments'] = hasAttachments;
    data['attachments'] = attachments.map((v) => v.toJson()).toList();
    data['size'] = size;
    data['downloadUrl'] = downloadUrl;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class CC {
  String address;
  String name;

  CC(this.address, this.name);

  factory CC.fromJson(Map<String, dynamic> json) =>
      CC(json['address'], json['name']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['name'] = name;
    return data;
  }
}

class Attachment {
  String id;
  String filename;
  String contentType;
  String disposition;
  String transferEncoding;
  bool related;
  int size;
  String downloadUrl;

  Attachment(this.id, this.filename, this.contentType, this.disposition,
      this.transferEncoding, this.related, this.size, this.downloadUrl);

  factory Attachment.fromJson(Map<String, dynamic> json) => Attachment(
      json['id'],
      json['filename'],
      json['contentType'],
      json['disposition'],
      json['transferEncoding'],
      json['related'],
      json['size'],
      json['downloadUrl']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['filename'] = filename;
    data['contentType'] = contentType;
    data['disposition'] = disposition;
    data['transferEncoding'] = transferEncoding;
    data['related'] = related;
    data['size'] = size;
    data['downloadUrl'] = downloadUrl;
    return data;
  }
}
