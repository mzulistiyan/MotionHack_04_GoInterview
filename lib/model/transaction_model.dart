import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class TransactionModel extends Equatable {
  final String id;
  final String userId;
  final String userHrId;
  final String nameUser;
  final String nameHR;
  final String position;
  final int price;
  final String fileResume;
  final String fileMotivationLetter;
  final String filePortofolio;
  final String payment_status;
  final String confirmation_status;
  TransactionModel({
    this.id = '',
    required this.userId,
    required this.userHrId,
    required this.nameUser,
    required this.nameHR,
    required this.position,
    required this.fileResume,
    required this.fileMotivationLetter,
    required this.filePortofolio,
    this.confirmation_status = 'Waiting',
    this.payment_status = 'paid',
    this.price = 50000,
  });

  factory TransactionModel.fromJson(String id, Map<String, dynamic> json) =>
      TransactionModel(
        id: id,
        nameUser: json['nameUser'].toString(),
        userId: json['userId'].toString(),
        userHrId: json['userHrId'].toString(),
        nameHR: json['nameHR'].toString(),
        position: json['position'].toString(),
        fileResume: json['fileResume'].toString(),
        fileMotivationLetter: json['fileMotivationLetter'].toString(),
        filePortofolio: json['filePortofolio'].toString(),
        confirmation_status: json['confirmation_status'].toString(),
        payment_status: json['payment_status'].toString(),
        price: json['price'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'nameUser': nameUser,
        'userId': userId,
        'userHrId': userHrId,
        'nameHR': nameHR,
        'position': position,
        'fileResume': fileResume,
        'fileMotivationLetter': fileMotivationLetter,
        'filePortofolio': filePortofolio,
        'confirmation_status': confirmation_status,
        'payment_status': payment_status,
        'price': price,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [
        nameUser,
        userId,
        userHrId,
        nameHR,
        position,
        fileResume,
        fileMotivationLetter,
        filePortofolio,
        confirmation_status,
        payment_status,
        price
      ];
}
