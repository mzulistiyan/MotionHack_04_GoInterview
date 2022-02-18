import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_motionhack/model/interview_model.dart';

import 'package:flutter_application_motionhack/model/transaction_model.dart';

class InterviewService {
  CollectionReference _transactionReference =
      FirebaseFirestore.instance.collection('interview');

  // // static Future<File> pickFile() async {
  // //   final result = await FilePicker.platform.pickFiles(
  // //     type: FileType.custom,
  // //     allowedExtensions: ['pdf'],
  // //   );

  // //   return File(result!.paths.first!);
  // // }

  // Future<void> setTransactionHr(TransactionModel transction) async {
  //   try {
  //     _transactionReference.doc(transction.id).set({
  //       'userId': transction.userId,
  //       'userHrId': transction.userHrId,
  //       'nameUser': transction.nameUser,
  //       'nameHr': transction.nameHR,
  //       'fileReseume': transction.fileResume,
  //       'fileMotivationLetter': transction.fileMotivationLetter,
  //       'filePorfotolio': transction.filePortofolio,
  //       'confirmation_status': transction.confirmation_status,
  //       'price': transction.price,
  //       'payment_status': transction.payment_status,
  //     });
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  // Future<void> updateUserAccept(String docid) async {
  //   return _transactionReference
  //       .doc(docid)
  //       .update({'confirmation_status': 'Accept'})
  //       .then((value) => print("User Updated"))
  //       .catchError((error) => print("Failed to update user: $error"));
  // }

  // Future<void> updateUserDeny(String docid) async {
  //   return _transactionReference
  //       .doc(docid)
  //       .update({'confirmation_status': 'Deny'})
  //       .then((value) => print("User Updated"))
  //       .catchError((error) => print("Failed to update user: $error"));
  // }

  Future<void> createInterview(InterviewModel interview, String transactionId,
      String date, String time) async {
    try {
      _transactionReference.add({
        'transactionId': transactionId,
        'userIdHr': interview.userHrId,
        'userId': interview.userId,
        'nameUser': interview.nameUser,
        'nameHr': interview.nameHR,
        'date': date,
        'time': time,
        'feedback': interview.feedback,
        'link': interview.link,
      });
    } catch (e) {
      throw e;
    }
  }

  // Future<List<TransactionModel>> fetchTransaction(String id) async {
  //   try {
  //     QuerySnapshot result = await FirebaseFirestore.instance
  //         .collection('transactions')
  //         .where('userIdHr', isEqualTo: id)
  //         .get();
  //     List<TransactionModel> transaction = result.docs.map((e) {
  //       return TransactionModel.fromJson(
  //           e.id, e.data() as Map<String, dynamic>);
  //     }).toList();

  //     return transaction;
  //   } catch (e) {
  //     print('Error');
  //     print(e.toString());
  //     throw e;
  //   }
  // }

  // Future<List<TransactionModel>> fetchTransactionUser(String id) async {
  //   try {
  //     QuerySnapshot result = await FirebaseFirestore.instance
  //         .collection('transactions')
  //         .where('confirmation_status', isEqualTo: 'Accept')
  //         .get();
  //     List<TransactionModel> transaction = result.docs.map((e) {
  //       return TransactionModel.fromJson(
  //           e.id, e.data() as Map<String, dynamic>);
  //     }).toList();

  //     return transaction;
  //   } catch (e) {
  //     print('Error');
  //     print(e.toString());
  //     throw e;
  //   }
  // }

}
