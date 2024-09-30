part of 'memes_cubit.dart';

@immutable
sealed class MemesState extends Equatable {}

final class MemesInitial extends MemesState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class MemesLoading extends MemesState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class MemesSuccess extends MemesState {
  final MemeResponseModel memeResponse;

  MemesSuccess(this.memeResponse);

  @override
  // TODO: implement props
  List<Object?> get props => [memeResponse];
}

final class MemesError extends MemesState {
  final String message;

  MemesError(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
