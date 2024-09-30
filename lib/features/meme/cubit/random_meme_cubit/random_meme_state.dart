part of 'random_meme_cubit.dart';

@immutable
sealed class RandomMemeState extends Equatable{

}

final class MemeInitial extends RandomMemeState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class RandomMemeLoading extends RandomMemeState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class RandomMemeSuccess extends RandomMemeState {
  final MemeModel meme;

  RandomMemeSuccess(this.meme);

  @override
  // TODO: implement props
  List<Object?> get props => [meme];
}

final class RandomMemeError extends RandomMemeState {
  final String? message;

  RandomMemeError(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
