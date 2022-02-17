import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_motionhack/model/transaction_model.dart';
import 'package:flutter_application_motionhack/model/user_hr_model.dart';
import 'package:flutter_application_motionhack/model/user_model.dart';

class UserHrService {
  CollectionReference _userReference =
      FirebaseFirestore.instance.collection('users');

  Future<void> setUserHr(UserHrModel user) async {
    try {
      _userReference.doc(user.id).set({
        'email': user.email,
        'name': user.name,
        'level': user.level,
      });
    } catch (e) {
      throw e;
    }
  }

  Future<List<UserHrModel>> fetchHumanResources() async {
    try {
      QuerySnapshot result = await FirebaseFirestore.instance
          .collection('users')
          .where('level', isEqualTo: 2)
          .get();
      List<UserHrModel> humanResources = result.docs.map((e) {
        return UserHrModel.fromJson(e.id, e.data() as Map<String, dynamic>);
      }).toList();

      return humanResources;
    } catch (e) {
      throw e;
    }
  }
}
