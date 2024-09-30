import 'package:bloc/bloc.dart';
import 'package:bloc_training_app/features/meme/data/model/meme_model.dart';
import 'package:bloc_training_app/features/meme/data/repo/meme_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'random_meme_state.dart';

class RandomMemeCubit extends Cubit<RandomMemeState> {
  final MemeRepo _repo;

  RandomMemeCubit(this._repo) : super(MemeInitial());

  void getRandomMeme() async {
    emit(RandomMemeLoading());
    final result = await _repo.getRandomMeme();
    if (result == null) {
      emit(RandomMemeError("Meme not found."));
      return;
    }
    emit(RandomMemeSuccess(result));
  }
}
