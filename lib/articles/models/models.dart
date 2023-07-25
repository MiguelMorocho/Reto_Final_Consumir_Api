// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);

import 'dart:convert';

class ArticlesResponse {
  final int status;
  final int page;
  final int total;
  final List<Article> data;

  ArticlesResponse({
    required this.status,
    required this.page,
    required this.total,
    required this.data,
  });

  factory ArticlesResponse.fromJson(String str) =>
      ArticlesResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ArticlesResponse.fromMap(Map<String, dynamic> json) =>
      ArticlesResponse(
        status: json["status"],
        page: json["page"],
        total: json["total"],
        data: List<Article>.from(json["data"].map((x) => Article.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "page": page,
        "total": total,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class ArticleResponse {
  final int status;
  final Article data;

  ArticleResponse({
    required this.status,
    required this.data,
  });

  factory ArticleResponse.fromJson(String str) =>
      ArticleResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ArticleResponse.fromMap(Map<String, dynamic> json) => ArticleResponse(
        status: json["status"],
        data: Article.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "data": data.toMap(),
      };
}

class Article {
  final String id;
  final String title;
  final String description;
  final Image image;
  final DateTime date;
  final List<Related> related;
  final Interaction interaction;
  final Endpoint endpoint;

  Article({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.date,
    required this.related,
    required this.interaction,
    required this.endpoint,
  });

  factory Article.fromJson(String str) => Article.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Article.fromMap(Map<String, dynamic> json) => Article(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        image: Image.fromMap(json["image"]),
        date: DateTime.parse(json["date"]),
        related:
            List<Related>.from(json["related"].map((x) => Related.fromMap(x))),
        interaction: interactionValues.map[json["interaction"]]!,
        endpoint: Endpoint.fromMap(json["endpoint"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "description": description,
        "image": image.toMap(),
        "date": date.toIso8601String(),
        "related": List<dynamic>.from(related.map((x) => x.toMap())),
        "interaction": interactionValues.reverse[interaction],
        "endpoint": endpoint.toMap(),
      };
}

class Endpoint {
  final String urlBase;
  final UrlPath urlPath;
  final bool authentication;
  final Version version;
  final Method method;
  final dynamic headers;
  final List<dynamic> queryParams;
  final List<PathVariable> pathVariables;
  final Gui gui;

  Endpoint({
    required this.urlBase,
    required this.urlPath,
    required this.authentication,
    required this.version,
    required this.method,
    this.headers,
    required this.queryParams,
    required this.pathVariables,
    required this.gui,
  });

  factory Endpoint.fromJson(String str) => Endpoint.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Endpoint.fromMap(Map<String, dynamic> json) => Endpoint(
        urlBase: json["url_base"],
        urlPath: urlPathValues.map[json["url_path"]]!,
        authentication: json["authentication"],
        version: versionValues.map[json["version"]]!,
        method: methodValues.map[json["method"]]!,
        headers: json["headers"],
        queryParams: List<dynamic>.from(json["query_params"].map((x) => x)),
        pathVariables: List<PathVariable>.from(
            json["path_variables"].map((x) => PathVariable.fromMap(x))),
        gui: Gui.fromMap(json["gui"]),
      );

  Map<String, dynamic> toMap() => {
        "url_base": urlBase,
        "url_path": urlPathValues.reverse[urlPath],
        "authentication": authentication,
        "version": versionValues.reverse[version],
        "method": methodValues.reverse[method],
        "headers": headers,
        "query_params": List<dynamic>.from(queryParams.map((x) => x)),
        "path_variables":
            List<dynamic>.from(pathVariables.map((x) => x.toMap())),
        "gui": gui.toMap(),
      };
}

class Gui {
  final Layout layout;
  final dynamic cardtype;

  Gui({
    required this.layout,
    this.cardtype,
  });

  factory Gui.fromJson(String str) => Gui.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Gui.fromMap(Map<String, dynamic> json) => Gui(
        layout: layoutValues.map[json["layout"]]!,
        cardtype: json["cardtype"],
      );

  Map<String, dynamic> toMap() => {
        "layout": layoutValues.reverse[layout],
        "cardtype": cardtype,
      };
}

enum Layout { SHOW }

final layoutValues = EnumValues({"show": Layout.SHOW});

enum Method { GET }

final methodValues = EnumValues({"GET": Method.GET});

class PathVariable {
  final Name name;
  final String value;
  final PathVariableType type;
  final dynamic defaultValue;

  PathVariable({
    required this.name,
    required this.value,
    required this.type,
    this.defaultValue,
  });

  factory PathVariable.fromJson(String str) =>
      PathVariable.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PathVariable.fromMap(Map<String, dynamic> json) => PathVariable(
        name: nameValues.map[json["name"]]!,
        value: json["value"],
        type: pathVariableTypeValues.map[json["type"]]!,
        defaultValue: json["default_value"],
      );

  Map<String, dynamic> toMap() => {
        "name": nameValues.reverse[name],
        "value": value,
        "type": pathVariableTypeValues.reverse[type],
        "default_value": defaultValue,
      };
}

enum Name { THE_1 }

final nameValues = EnumValues({"{1}": Name.THE_1});

enum PathVariableType { BODY }

final pathVariableTypeValues = EnumValues({"body": PathVariableType.BODY});

enum UrlPath { NEWS_SHOW_1 }

final urlPathValues = EnumValues({"news/show/{1}": UrlPath.NEWS_SHOW_1});

enum Version { V1 }

final versionValues = EnumValues({"/v1/": Version.V1});

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

enum Interaction { ENDPOINT }

final interactionValues = EnumValues({"endpoint": Interaction.ENDPOINT});

class Related {
  final RelatedType type;
  final String id;
  final String name;
  final bool deprecated;
  final bool enable;

  Related({
    required this.type,
    required this.id,
    required this.name,
    required this.deprecated,
    required this.enable,
  });

  factory Related.fromJson(String str) => Related.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Related.fromMap(Map<String, dynamic> json) => Related(
        type: relatedTypeValues.map[json["type"]]!,
        id: json["id"],
        name: json["name"],
        deprecated: json["deprecated"],
        enable: json["enable"],
      );

  Map<String, dynamic> toMap() => {
        "type": relatedTypeValues.reverse[type],
        "id": id,
        "name": name,
        "deprecated": deprecated,
        "enable": enable,
      };
}

enum RelatedType { CATEGORA }

final relatedTypeValues = EnumValues({"categoría": RelatedType.CATEGORA});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
