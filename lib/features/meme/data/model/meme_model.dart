import 'package:equatable/equatable.dart';

class MemeModel extends Equatable {
  MemeModel({
    this.postLink,
    this.subreddit,
    this.title,
    this.url,
    this.nsfw,
    this.spoiler,
    this.author,
    this.ups,
    this.preview,
  });

  final String? postLink;
  final String? subreddit;
  final String? title;
  final String? url;
  final bool? nsfw;
  final bool? spoiler;
  final String? author;
  final num? ups;
  final List<String>? preview;

  MemeModel copyWith({
    String? postLink,
    String? subreddit,
    String? title,
    String? url,
    bool? nsfw,
    bool? spoiler,
    String? author,
    num? ups,
    List<String>? preview,
  }) =>
      MemeModel(
        postLink: postLink ?? this.postLink,
        subreddit: subreddit ?? this.subreddit,
        title: title ?? this.title,
        url: url ?? this.url,
        nsfw: nsfw ?? this.nsfw,
        spoiler: spoiler ?? this.spoiler,
        author: author ?? this.author,
        ups: ups ?? this.ups,
        preview: preview ?? this.preview,
      );

  factory MemeModel.fromJson(Map<String, dynamic> json) {
    return MemeModel(
      postLink: json["postLink"],
      subreddit: json["subreddit"],
      title: json["title"],
      url: json["url"],
      nsfw: json["nsfw"],
      spoiler: json["spoiler"],
      author: json["author"],
      ups: json["ups"],
      preview: List.of(json["preview"])
          .where((e) => e != null)
          .map((e) => e.toString())
          .toList(),
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        postLink,
        subreddit,
        title,
        url,
        nsfw,
        spoiler,
        author,
        ups,
        preview,
      ];
}
