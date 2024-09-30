part of 'meme_cubit.dart';

@immutable
sealed class MemeState extends Equatable{

}

final class MemeInitial extends MemeState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class MemeLoading extends MemeState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class MemeSuccess extends MemeState {
  final MemeModel meme;

  MemeSuccess(this.meme);

  @override
  // TODO: implement props
  List<Object?> get props => [meme];
}

final class MemeError extends MemeState {
  final String? message;

  MemeError(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
