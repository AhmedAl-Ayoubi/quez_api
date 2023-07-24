// To parse this JSON data, do
//
//     final randomPicture = randomPictureFromJson(jsonString);

import 'dart:convert';

RandomPicture randomPictureFromJson(String str) => RandomPicture.fromJson(json.decode(str));

String randomPictureToJson(RandomPicture data) => json.encode(data.toJson());

class RandomPicture {
  String provider;
  String license;
  String terms;
  String url;
  Size size;

  RandomPicture({
    required this.provider,
    required this.license,
    required this.terms,
    required this.url,
    required this.size,
  });

  factory RandomPicture.fromJson(Map<String, dynamic> json) => RandomPicture(
    provider: json["provider"],
    license: json["license"],
    terms: json["terms"],
    url: json["url"],
    size: Size.fromJson(json["size"]),
  );

  Map<String, dynamic> toJson() => {
    "provider": provider,
    "license": license,
    "terms": terms,
    "url": url,
    "size": size.toJson(),
  };
}

class Size {
  int height;
  int width;

  Size({
    required this.height,
    required this.width,
  });

  factory Size.fromJson(Map<String, dynamic> json) => Size(
    height: json["height"],
    width: json["width"],
  );

  Map<String, dynamic> toJson() => {
    "height": height,
    "width": width,
  };
}
