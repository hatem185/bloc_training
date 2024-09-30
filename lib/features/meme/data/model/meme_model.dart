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

  MemeModel.fromJson(Map<String, dynamic> json) {
    postLink = json['postLink'];
    subreddit = json['subreddit'];
    title = json['title'];
    url = json['url'];
    nsfw = json['nsfw'];
    spoiler = json['spoiler'];
    author = json['author'];
    ups = json['ups'];
    preview = json['preview'] != null ? json['preview'].cast<String>() : [];
  }

  String? postLink;
  String? subreddit;
  String? title;
  String? url;
  bool? nsfw;
  bool? spoiler;
  String? author;
  num? ups;
  List<String>? preview;

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

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['postLink'] = postLink;
    map['subreddit'] = subreddit;
    map['title'] = title;
    map['url'] = url;
    map['nsfw'] = nsfw;
    map['spoiler'] = spoiler;
    map['author'] = author;
    map['ups'] = ups;
    map['preview'] = preview;
    return map;
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
