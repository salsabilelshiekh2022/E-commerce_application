part of 'cubit.dart';

sealed class CartState {
  const CartState();
}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class GetCartItems extends CartState {}

final class AddToCart extends CartState {}

final class RemoveFromCart extends CartState {}
