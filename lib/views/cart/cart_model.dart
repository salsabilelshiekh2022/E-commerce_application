import 'package:equatable/equatable.dart';

class CartModel extends Equatable {
  final bool? status;
  final dynamic message;
  final Data? data;

  const CartModel({this.status, this.message, this.data});

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        status: json['status'] as bool?,
        message: json['message'] as dynamic,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };

  @override
  List<Object?> get props => [status, message, data];
}

class Data extends Equatable {
  final List<CartItem>? cartItems;
  final int? subTotal;
  final int? total;

  const Data({this.cartItems, this.subTotal, this.total});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        cartItems: (json['cart_items'] as List<dynamic>?)
            ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
            .toList(),
        subTotal: json['sub_total'] as int?,
        total: json['total'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'cart_items': cartItems?.map((e) => e.toJson()).toList(),
        'sub_total': subTotal,
        'total': total,
      };

  @override
  List<Object?> get props => [cartItems, subTotal, total];
}

class CartItem extends Equatable {
  final int? id;
  final int? quantity;
  final Product? product;

  const CartItem({this.id, this.quantity, this.product});

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        id: json['id'] as int?,
        quantity: json['quantity'] as int?,
        product: json['product'] == null
            ? null
            : Product.fromJson(json['product'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'quantity': quantity,
        'product': product?.toJson(),
      };

  @override
  List<Object?> get props => [id, quantity, product];
}

class Product extends Equatable {
  final int? id;
  final double? price;
  final double? oldPrice;
  final dynamic discount;
  final String? image;
  final String? name;
  final String? description;
  final List<dynamic> images;
  final bool? inFavorites;
  final bool? inCart;

  const Product({
    this.id,
    this.price,
    this.oldPrice,
    this.discount,
    this.image,
    this.name,
    this.description,
    required this.images,
    this.inFavorites,
    this.inCart,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'] as int?,
        price: (json['price'] as num?)?.toDouble(),
        oldPrice: (json['old_price'] as num?)?.toDouble(),
        discount: json['discount'] as dynamic,
        image: json['image'] as String?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        images: json['images'] as List<dynamic>,
        inFavorites: json['in_favorites'] as bool?,
        inCart: json['in_cart'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'price': price,
        'old_price': oldPrice,
        'discount': discount,
        'image': image,
        'name': name,
        'description': description,
        'images': images,
        'in_favorites': inFavorites,
        'in_cart': inCart,
      };

  @override
  List<Object?> get props {
    return [
      id,
      price,
      oldPrice,
      discount,
      image,
      name,
      description,
      images,
      inFavorites,
      inCart,
    ];
  }
}
