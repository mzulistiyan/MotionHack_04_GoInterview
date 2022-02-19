import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_application_motionhack/model/transaction_model.dart';

class TransactionService {
  CollectionReference _transactionReference =
      FirebaseFirestore.instance.collection('transactions');

  // static Future<File> pickFile() async {
  //   final result = await FilePicker.platform.pickFiles(
  //     type: FileType.custom,
  //     allowedExtensions: ['pdf'],
  //   );

  //   return File(result!.paths.first!);
  // }

  Future<void> setTransactionHr(TransactionModel transction) async {
    try {
      _transactionReference.doc(transction.id).set({
        'userId': transction.userId,
        'userHrId': transction.userHrId,
        'nameUser': transction.nameUser,
        'nameHr': transction.nameHR,
        'fileReseume': transction.fileResume,
        'fileMotivationLetter': transction.fileMotivationLetter,
        'filePorfotolio': transction.filePortofolio,
        'confirmation_status': transction.confirmation_status,
        'price': transction.price,
        'payment_status': transction.payment_status,
      });
    } catch (e) {
      throw e;
    }
  }

  Future<void> updateUserAccept(String docid) async {
    return _transactionReference
        .doc(docid)
        .update({'confirmation_status': 'Accept'})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  Future<void> updateUserDeny(String docid) async {
    return _transactionReference
        .doc(docid)
        .update({'confirmation_status': 'Denied'})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  Future<void> createTransaction(TransactionModel transaction) async {
    try {
      _transactionReference.add({
        'userIdHr': transaction.userHrId,
        'userId': transaction.userId,
        'nameUser': transaction.nameUser,
        'nameHr': transaction.nameHR,
        'position': transaction.position,
        'fileResume': transaction.fileResume,
        'fileMotivationLetter': transaction.fileMotivationLetter,
        'filePortofolio': transaction.filePortofolio,
        'price': transaction.price,
        'payment_status': transaction.payment_status,
        'confirmation_status': transaction.confirmation_status,
      });
    } catch (e) {
      throw e;
    }
  }

  Future<List<TransactionModel>> fetchTransaction(String id) async {
    try {
      QuerySnapshot result = await FirebaseFirestore.instance
          .collection('transactions')
          .where('userIdHr', isEqualTo: id)
          .get();
      List<TransactionModel> transaction = result.docs.map((e) {
        return TransactionModel.fromJson(
            e.id, e.data() as Map<String, dynamic>);
      }).toList();

      return transaction;
    } catch (e) {
      print('Error');
      print(e.toString());
      throw e;
    }
  }

  Future<List<TransactionModel>> fetchTransactionUser(
      String id, String userId) async {
    try {
      QuerySnapshot result = await FirebaseFirestore.instance
          .collection('transactions')
          .where('confirmation_status', isEqualTo: 'Accept')
          .where('userId', isEqualTo: userId)
          .get();
      List<TransactionModel> transaction = result.docs.map((e) {
        return TransactionModel.fromJson(
            e.id, e.data() as Map<String, dynamic>);
      }).toList();

      return transaction;
    } catch (e) {
      print('Error');
      print(e.toString());
      throw e;
    }
  }

  Future<List<TransactionModel>> fetchTransactionUserStatus(
      String id, String userId) async {
    try {
      QuerySnapshot result = await FirebaseFirestore.instance
          .collection('transactions')
          .where('userId', isEqualTo: userId)
          .get();
      List<TransactionModel> transaction = result.docs.map((e) {
        return TransactionModel.fromJson(
            e.id, e.data() as Map<String, dynamic>);
      }).toList();

      return transaction;
    } catch (e) {
      print('Error');
      print(e.toString());
      throw e;
    }
  }

  Future<TransactionModel> getUserHrById(String id) async {
    try {
      DocumentSnapshot snapshot = await _transactionReference.doc(id).get();
      return TransactionModel(
        position: snapshot['position'],
        id: id,
        nameHR: snapshot['nameHR'],
        nameUser: snapshot['nameUser'],
        userHrId: snapshot['userHrId'],
        userId: snapshot['userId'],
        confirmation_status: snapshot['confirmation_status'],
        payment_status: snapshot['payment_status'],
        price: snapshot['price'],
        fileMotivationLetter: snapshot['fileMotivationLetter'],
        fileResume: snapshot['fileResume'],
        filePortofolio: snapshot['filePortofolio'],
      );
    } catch (e) {
      throw e;
    }
  }
}
