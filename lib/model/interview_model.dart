import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class InterviewModel extends Equatable {
  final String id;
  final String transactionId;
  final String userId;
  final String userHrId;
  final String nameUser;
  final String nameHR;
  final String date;
  final String time;
  final String feedback;
  final String link;

  InterviewModel({
    this.id = '',
    required this.transactionId,
    required this.userId,
    required this.userHrId,
    required this.nameUser,
    required this.nameHR,
    this.link = '',
    this.date = '',
    this.time = '',
    this.feedback = '',
  });

  factory InterviewModel.fromJson(String id, Map<String, dynamic> json) =>
      InterviewModel(
        id: id,
        transactionId: json['transactionId'].toString(),
        nameUser: json['nameUser'].toString(),
        userId: json['userId'].toString(),
        userHrId: json['userHrId'].toString(),
        nameHR: json['nameHR'].toString(),
        date: json['date'].toString(),
        time: json['time'].toString(),
        feedback: json['feedback'].toString(),
        link: json['link'].toString(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'nameUser': nameUser,
        'userId': userId,
        'userHrId': userHrId,
        'nameHR': nameHR,
        'date': date,
        'time': time,
        'feedback': feedback,
        'link': link,
        'transactionId': transactionId,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [
        nameUser,
        userId,
        userHrId,
        nameHR,
        date,
        time,
        feedback,
        link,
        transactionId
      ];
}
