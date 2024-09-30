import 'package:bloc_training_app/features/meme/data/model/meme_model.dart';
import 'package:bloc_training_app/features/meme/data/repo/meme_api_data_provider.dart';

class MemeRepo {
  final MemeApiDataProvider _dataProvider;

  const MemeRepo(this._dataProvider);

  Future<MemeModel?> getRandomMeme() async {
    return await _dataProvider.getRandomMeme();
  }
}
