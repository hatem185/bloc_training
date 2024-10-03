import 'package:bloc_training_app/features/meme/data/repo/meme_api_data_provider.dart';
import 'package:bloc_training_app/features/meme/data/repo/meme_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initLocator() {
  getIt.registerLazySingleton<Dio>(() => Dio());

  getIt.registerLazySingleton<MemeApiDataProvider>(
    () => MemeApiDataProvider(
      getIt<Dio>(),
    ),
  );

  getIt.registerLazySingleton<MemeRepo>(
    () => MemeRepo(
      getIt<MemeApiDataProvider>(),
    ),
  );
}
