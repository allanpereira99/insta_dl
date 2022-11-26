class ResultParse {
  List<Url>? url;
  Meta? meta;
  String? thumb;
  String? hosting;
  int? timestamp;

  ResultParse({this.url, this.meta, this.thumb, this.hosting, this.timestamp});

  ResultParse.fromJson(Map<String, dynamic> json) {
    if (json['url'] != null) {
      url = <Url>[];
      json['url'].forEach((v) {
        url!.add(Url.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    thumb = json['thumb'];
    hosting = json['hosting'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (url != null) {
      data['url'] = url!.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    data['thumb'] = thumb;
    data['hosting'] = hosting;
    data['timestamp'] = timestamp;
    return data;
  }
}

class Url {
  String? url;
  String? name;
  String? type;
  String? ext;

  Url({this.url, this.name, this.type, this.ext});

  Url.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    name = json[' name'];
    type = json['type'];
    ext = json['ext'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data[' name'] = name;
    data['type'] = type;
    data['ext'] = ext;
    return data;
  }
}

class Meta {
  String? title;
  String? source;

  Meta({this.title, this.source});

  Meta.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    source = json['source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['source'] = source;
    return data;
  }
}
