part of 'cubit.dart';

sealed class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

final class FavoriteInitial extends FavoriteState {}

final class GetFavorites extends FavoriteState {}

final class AddToFavorite extends FavoriteState {}

final class RemoveFromFavorite extends FavoriteState {}
