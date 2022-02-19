import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_motionhack/model/interview_model.dart';

import 'package:flutter_application_motionhack/model/transaction_model.dart';

class InterviewService {
  CollectionReference _transactionReference =
      FirebaseFirestore.instance.collection('interview');

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
        'link':
            'https://flutter.dev/?gclid=CjwKCAiAx8KQBhAGEiwAD3EiP6zIAhWR2NFdnbfUQC3u6Tr4E4z6lGcO9HZZq0DBDdFqkD6S5ZXVkhoC6a4QAvD_BwE&gclsrc=aw.ds',
      }).then((value) => print('Success'));
    } catch (e) {
      throw e;
    }
  }

  Future<List<InterviewModel>> fetchInterview(String id) async {
    try {
      QuerySnapshot result = await FirebaseFirestore.instance
          .collection('interview')
          .where('userId', isEqualTo: id)
          .get();
      List<InterviewModel> interview = result.docs.map((e) {
        return InterviewModel.fromJson(e.id, e.data() as Map<String, dynamic>);
      }).toList();

      return interview;
    } catch (e) {
      print('Error');
      print(e.toString());
      throw e;
    }
  }

  Future<List<InterviewModel>> fetchInterviewForHr(String id) async {
    try {
      QuerySnapshot result = await FirebaseFirestore.instance
          .collection('interview')
          .where('userIdHr', isEqualTo: id)
          .get();
      List<InterviewModel> interview = result.docs.map((e) {
        return InterviewModel.fromJson(e.id, e.data() as Map<String, dynamic>);
      }).toList();

      return interview;
    } catch (e) {
      print('Error');
      print(e.toString());
      throw e;
    }
  }

  Future<void> updateFeedback(String docid) async {
    return _transactionReference
        .doc(docid)
        .update({'feedback': 'lorem ipsum dolor sit amet'})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }
}
