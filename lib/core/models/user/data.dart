import 'package:equatable/equatable.dart';

class Data extends Equatable {
  final String? name;
  final String? phone;
  final String? email;
  final int? id;
  final String? image;
  final String? token;

  const Data({
    this.name,
    this.phone,
    this.email,
    this.id,
    this.image,
    this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json['name'] as String?,
        phone: json['phone'] as String?,
        email: json['email'] as String?,
        id: json['id'] as int?,
        image: json['image'] as String?,
        token: json['token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'phone': phone,
        'email': email,
        'id': id,
        'image': image,
        'token': token,
      };

  @override
  List<Object?> get props => [name, phone, email, id, image, token];
}
