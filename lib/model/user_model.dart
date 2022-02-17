import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class UserModel extends Equatable {
  final String id;
  final String email;
  final String name;
  final String level;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    this.level = "1",
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        email,
        name,
        level,
      ];
}
