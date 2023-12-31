class ProductModel {
  final int? id;
  final dynamic price;
  final dynamic oldPrice;
  final int? discount;
  final String? image;
  final String? name;
  final String? description;

  const ProductModel({
    this.id,
    this.price,
    this.oldPrice,
    this.discount,
    this.image,
    this.name,
    this.description,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'] as int?,
        price: json['price'] as dynamic,
        oldPrice: json['old_price'] as dynamic,
        discount: json['discount'] as int?,
        image: json['image'] as String?,
        name: json['name'] as String?,
        description: json['description'] as String?,
      );
}
