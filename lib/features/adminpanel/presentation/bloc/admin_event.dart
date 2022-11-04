part of 'admin_bloc.dart';

abstract class AdminEvent extends Equatable {
  const AdminEvent();

  @override
  List<Object> get props => [];
}

class SetAnimeDataEvent extends AdminEvent {
  final AnimeEntity anime;
  final File file;
  const SetAnimeDataEvent(this.anime, this.file);
}
