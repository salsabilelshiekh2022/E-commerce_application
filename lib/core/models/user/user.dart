import 'user_data.dart';

class User {
  final bool? status;
  final String? message;
  final UserData? data;

  const User({this.status, this.message, this.data});

  factory User.fromJson(Map<String, dynamic> json) => User(
        status: json['status'] as bool?,
        message: json['message'] as String?,
        data: json['data'] == null
            ? null
            : UserData.fromJson(json['data'] as Map<String, dynamic>),
      );
}
