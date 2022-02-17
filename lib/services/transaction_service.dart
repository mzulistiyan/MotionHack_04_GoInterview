import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_application_motionhack/model/transaction_model.dart';

class TransactionService {
  CollectionReference _transactionReference =
      FirebaseFirestore.instance.collection('transactions');

  static Future<File> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    return File(result!.paths.first!);
  }

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

  Future<void> createTransaction(TransactionModel transaction) async {
    try {
      _transactionReference.add({
        'userIdHr': transaction.userHrId,
        'userId': transaction.userId,
        'nameUser': transaction.nameUser,
        'nameHr': transaction.nameHR,
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

  Future<List<TransactionModel>> fetchTransaction() async {
    try {
      QuerySnapshot result = await _transactionReference.get();
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
}
