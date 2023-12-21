
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class DescriptionController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<QueryDocumentSnapshot<Object?>>> getDescriptionData() async {
    final QuerySnapshot descriptionData =
    await _firestore.collection('description').get();
    return descriptionData.docs;
  }
}




