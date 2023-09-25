part of 'cubit.dart';

sealed class FavoriteState {
  const FavoriteState();
}

final class FavoriteInitial extends FavoriteState {}

final class GetFavorites extends FavoriteState {}

final class AddToFavorite extends FavoriteState {}

final class RemoveFromFavorite extends FavoriteState {}

final class ShowGridView extends FavoriteState {}

final class ShowList extends FavoriteState {}
