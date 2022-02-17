import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_motionhack/model/budis.dart';

class CobaServices {
  CollectionReference _destinationReference =
      FirebaseFirestore.instance.collection('coba');

  Future<List<CobaModel>> fetchCoba() async {
    try {
      QuerySnapshot result = await _destinationReference.get();
      List<CobaModel> destinations = result.docs.map((e) {
        return CobaModel.fromJson(e.id, e.data() as Map<String, dynamic>);
      }).toList();

      return destinations;
    } catch (e) {
      throw e;
    }
  }
}
