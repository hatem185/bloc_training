import 'package:bloc_training_app/features/meme/data/model/meme_model.dart';
import 'package:bloc_training_app/features/meme/data/model/meme_response.dart';
import 'package:bloc_training_app/features/meme/data/repo/meme_api_data_provider.dart';

class MemeRepo {
  final MemeApiDataProvider _dataProvider;

  MemeRepo(this._dataProvider) {
    print("MemeRepo");
  }

  Future<MemeModel?> getRandomMeme() async {
    return await _dataProvider.getRandomMeme();
  }

  Future<MemeResponseModel?> fetchMemes(int memesCount) async {
    return await _dataProvider.fetchMemes(memesCount);
  }
}
