
import 'dart:convert';

Article articleFromJson(String str) => Article.fromJson(json.decode(str));

String articleToJson(Article data) => json.encode(data.toJson());

class Article {
  String id;
  String author;
  String content;
  List<String> tags;
  String authorSlug;
  int length;
  DateTime dateAdded;
  DateTime dateModified;

  Article({
    required this.id,
    required this.author,
    required this.content,
    required this.tags,
    required this.authorSlug,
    required this.length,
    required this.dateAdded,
    required this.dateModified,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
    id: json["_id"],
    author: json["author"],
    content: json["content"],
    tags: List<String>.from(json["tags"].map((x) => x)),
    authorSlug: json["authorSlug"],
    length: json["length"],
    dateAdded: DateTime.parse(json["dateAdded"]),
    dateModified: DateTime.parse(json["dateModified"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "author": author,
    "content": content,
    "tags": List<dynamic>.from(tags.map((x) => x)),
    "authorSlug": authorSlug,
    "length": length,
    "dateAdded": "${dateAdded.year.toString().padLeft(4, '0')}-${dateAdded.month.toString().padLeft(2, '0')}-${dateAdded.day.toString().padLeft(2, '0')}",
    "dateModified": "${dateModified.year.toString().padLeft(4, '0')}-${dateModified.month.toString().padLeft(2, '0')}-${dateModified.day.toString().padLeft(2, '0')}",
  };
}
