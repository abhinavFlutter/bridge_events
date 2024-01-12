
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

// Fire base fire store connection

class EventCategoryController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<QueryDocumentSnapshot<Object?>>> getEventCategoryData() async {
    final QuerySnapshot eventCategoryData =
        await _firestore.collection('eventcategory').get();
    return eventCategoryData.docs;
  }
}


