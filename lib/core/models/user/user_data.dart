class UserData {
  final String? name;
  final String? phone;
  final String? email;
  final int? id;
  final String? image;
  final String? token;

  const UserData({
    this.name,
    this.phone,
    this.email,
    this.id,
    this.image,
    this.token,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        name: json['name'] as String?,
        phone: json['phone'] as String?,
        email: json['email'] as String?,
        id: json['id'] as int?,
        image: json['image'] as String?,
        token: json['token'] as String?,
      );
}
