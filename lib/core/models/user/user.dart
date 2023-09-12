import 'package:equatable/equatable.dart';

import 'data.dart';

class User extends Equatable {
  final bool? status;
  final String? message;
  final Data? data;

  const User({this.status, this.message, this.data});

  factory User.fromJson(Map<String, dynamic> json) => User(
        status: json['status'] as bool?,
        message: json['message'] as String?,
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
