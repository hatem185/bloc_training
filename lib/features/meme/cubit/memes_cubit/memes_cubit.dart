import 'package:bloc/bloc.dart';
import 'package:bloc_training_app/features/meme/data/model/meme_response.dart';
import 'package:bloc_training_app/features/meme/data/repo/meme_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'memes_state.dart';

class MemesCubit extends Cubit<MemesState> {
  final MemeRepo _repo;

  MemesCubit(this._repo) : super(MemesInitial());

  void fetchMemes() async {
    emit(MemesLoading());
    final result = await _repo.fetchMemes(10);
    if (result == null || result.memes?.isEmpty == true) {
      emit(MemesError("Memes not found."));
      return;
    }
    emit(MemesSuccess(result));
  }
}
