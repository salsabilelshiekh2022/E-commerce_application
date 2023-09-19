class ProductModel {
  final int? id;
  final double? price;
  final double? oldPrice;
  final int? discount;
  final String? image;
  final String? name;
  final String? description;
  final List<dynamic> images;
  final bool? inFavorites;
  final bool? inCart;

  const ProductModel({
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

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'] as int?,
        price: (json['price'] as num?)?.toDouble(),
        oldPrice: (json['old_price'] as num?)?.toDouble(),
        discount: json['discount'] as int?,
        image: json['image'] as String?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        images: json['images'] as List<dynamic>,
        inFavorites: json['in_favorites'] as bool?,
        inCart: json['in_cart'] as bool?,
      );
}
