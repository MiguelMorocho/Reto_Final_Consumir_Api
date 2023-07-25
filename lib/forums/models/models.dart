// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);

import 'dart:convert';

class ForumsResponse {
  final int total;
  final int status;
  final String page;
  final List<Forum> data;

  ForumsResponse({
    required this.total,
    required this.status,
    required this.page,
    required this.data,
  });

  factory ForumsResponse.fromJson(String str) =>
      ForumsResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ForumsResponse.fromMap(Map<String, dynamic> json) => ForumsResponse(
        total: json["total"],
        status: json["status"],
        page: json["page"],
        data: List<Forum>.from(json["data"].map((x) => Forum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "total": total,
        "status": status,
        "page": page,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class ForumResponse {
  final int status;
  final Forum data;

  ForumResponse({
    required this.status,
    required this.data,
  });

  factory ForumResponse.fromJson(String str) =>
      ForumResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ForumResponse.fromMap(Map<String, dynamic> json) => ForumResponse(
        status: json["status"],
        data: Forum.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "data": data.toMap(),
      };
}

class Forum {
  final String id;
  final String title;
  final List<Related> related;
  final String interaction;
  final String description;
  final dynamic view;
  final dynamic date;
  final dynamic source;
  final Image image;
  final dynamic video;
  final bool deprecated;
  final bool enable;
  final dynamic endpoint;

  Forum({
    required this.id,
    required this.title,
    required this.related,
    required this.interaction,
    required this.description,
    this.view,
    this.date,
    this.source,
    required this.image,
    this.video,
    required this.deprecated,
    required this.enable,
    this.endpoint,
  });

  factory Forum.fromJson(String str) => Forum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Forum.fromMap(Map<String, dynamic> json) => Forum(
        id: json["id"],
        title: json["title"],
        related:
            List<Related>.from(json["related"].map((x) => Related.fromMap(x))),
        interaction: json["interaction"],
        description: json["description"],
        view: json["view"],
        date: json["date"],
        source: json["source"],
        image: Image.fromMap(json["image"]),
        video: json["video"],
        deprecated: json["deprecated"],
        enable: json["enable"],
        endpoint: json["endpoint"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "related": List<dynamic>.from(related.map((x) => x.toMap())),
        "interaction": interaction,
        "description": description,
        "view": view,
        "date": date,
        "source": source,
        "image": image.toMap(),
        "video": video,
        "deprecated": deprecated,
        "enable": enable,
        "endpoint": endpoint,
      };
}

class Image {
  final String url;
  final String thumb;
  final String medium;

  Image({
    required this.url,
    required this.thumb,
    required this.medium,
  });

  factory Image.fromJson(String str) => Image.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Image.fromMap(Map<String, dynamic> json) => Image(
        url: json["url"],
        thumb: json["thumb"],
        medium: json["medium"],
      );

  Map<String, dynamic> toMap() => {
        "url": url,
        "thumb": thumb,
        "medium": medium,
      };
}

class Related {
  final Type type;
  final String name;
  final dynamic identifier;

  Related({
    required this.type,
    required this.name,
    this.identifier,
  });

  factory Related.fromJson(String str) => Related.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Related.fromMap(Map<String, dynamic> json) => Related(
        type: typeValues.map[json["type"]]!,
        name: json["name"],
        identifier: json["identifier"],
      );

  Map<String, dynamic> toMap() => {
        "type": typeValues.reverse[type],
        "name": name,
        "identifier": identifier,
      };
}

enum Type { FECHA, DURACIN }

final typeValues = EnumValues({"Duración": Type.DURACIN, "Fecha": Type.FECHA});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
