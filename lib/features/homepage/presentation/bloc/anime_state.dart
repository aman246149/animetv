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

  const GetAnimeSuccessFullState(this.anime);
}

class GetAnimeFailureState extends AnimeState {
  final String error;

  const GetAnimeFailureState(this.error);
}
