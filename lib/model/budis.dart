import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class CobaModel extends Equatable {
  final String id;
  final String budi;

  CobaModel({
    required this.id,
    required this.budi,
  });

  factory CobaModel.fromJson(String id, Map<String, dynamic> json) => CobaModel(
        id: id,
        budi: json['budi'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'budi': budi,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        budi,
      ];
}
