import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class TransactionModel extends Equatable {
  final String id;
  final String userId;
  final String userHrId;
  final String nameUser;
  final String nameHR;
  final String schedule;
  final String feedback;
  final String link;

  TransactionModel({
    this.id = '',
    required this.userId,
    required this.userHrId,
    required this.nameUser,
    required this.nameHR,
    required this.link,
    required this.schedule,
    this.feedback = '',
  });

  factory TransactionModel.fromJson(String id, Map<String, dynamic> json) =>
      TransactionModel(
        id: id,
        nameUser: json['nameUser'].toString(),
        userId: json['userId'].toString(),
        userHrId: json['userHrId'].toString(),
        nameHR: json['nameHR'].toString(),
        schedule: json['schedule'].toString(),
        feedback: json['feedback'].toString(),
        link: json['link'].toString(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'nameUser': nameUser,
        'userId': userId,
        'userHrId': userHrId,
        'nameHR': nameHR,
        'schedule': schedule,
        'feedback': feedback,
        'link': link,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [
        nameUser,
        userId,
        userHrId,
        nameHR,
        schedule,
        feedback,
        link,
      ];
}
