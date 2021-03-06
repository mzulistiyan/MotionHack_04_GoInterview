import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class UserModel extends Equatable {
  final String id;
  final String email;
  final String name;
  final int level;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    this.level = 1,
  });

  factory UserModel.fromJson(String id, Map<String, dynamic> json) => UserModel(
        id: id,
        email: json['email'],
        name: json['name'],
        level: json['level'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'level': level,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        email,
        name,
        level,
      ];
}
