import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class UserHrModel extends Equatable {
  final String id;
  final String email;
  final String name;
  final int level;

  UserHrModel({
    required this.id,
    required this.email,
    required this.name,
    this.level = 1,
  });

  factory UserHrModel.fromJson(String id, Map<String, dynamic> json) =>
      UserHrModel(
        id: id,
        email: json['email'],
        name: json['name'],
        level: json['level'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
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
