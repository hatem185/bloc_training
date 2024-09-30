import 'package:bloc/bloc.dart';
import 'package:bloc_training_app/features/meme/data/model/meme_model.dart';
import 'package:bloc_training_app/features/meme/data/repo/meme_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'meme_state.dart';

class MemeCubit extends Cubit<MemeState> {
  final MemeRepo _repo;

  MemeCubit(this._repo) : super(MemeInitial());

  void getRandomMeme() async {
    emit(MemeLoading());
    final result = await _repo.getRandomMeme();
    if (result == null) {
      emit(MemeError("Meme not found."));
      return;
    }
    emit(MemeSuccess(result));
  }
}
