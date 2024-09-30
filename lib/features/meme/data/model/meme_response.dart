import 'package:bloc_training_app/features/meme/data/model/meme_model.dart';

class MemeResponseModel {
  MemeResponseModel({
    this.count,
    this.memes,
  });

  MemeResponseModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['memes'] != null) {
      memes = [];
      json['memes']?.forEach((v) {
        memes?.add(MemeModel.fromJson(v));
      });
    }
  }

  int? count;
  List<MemeModel>? memes;

  MemeResponseModel copyWith({
    int? count,
    List<MemeModel>? memes,
  }) =>
      MemeResponseModel(
        count: count ?? this.count,
        memes: memes ?? this.memes,
      );
}
