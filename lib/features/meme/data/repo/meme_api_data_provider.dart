import 'package:bloc_training_app/core/constants/api_constants.dart';
import 'package:bloc_training_app/features/meme/data/model/meme_model.dart';
import 'package:dio/dio.dart';

class MemeApiDataProvider {
  final Dio client;

  const MemeApiDataProvider(this.client);

  Future<MemeModel?> getRandomMeme() async {
    try {
      final response = await client.get(ApiConstants.memeGimme);
      final Map<String, dynamic> responseData = response.data;
      return MemeModel.fromJson(responseData);
    } on DioException catch (e) {
      print(e.message);
      print(e.stackTrace);
    } catch (e, s) {
      print(e);
      print(s);
    }
    return null;
  }
}
