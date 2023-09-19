part of 'cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class GetCartItems extends CartState {}

final class AddToCart extends CartState {}

final class RemoveFromCart extends CartState {}
