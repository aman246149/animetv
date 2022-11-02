part of 'anime_bloc.dart';

abstract class AnimeState extends Equatable {
  const AnimeState();

  @override
  List<Object> get props => [];
}

class AnimeInitial extends AnimeState {}

class GetAnimeLoadingState extends AnimeState {}

class GetAnimeSuccessFullState extends AnimeState {
  final List<AnimeModel> anime;

  GetAnimeSuccessFullState(this.anime);
}

class GetAnimeFailureState extends AnimeState {
  final String error;

  GetAnimeFailureState(this.error);
}
