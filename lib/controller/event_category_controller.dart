
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








// GetX Controller
//
// class MainScreenController extends GetxController {
//   RxString titles  = ''.obs;
//   RxString imagePaths  = ''.obs;
//
//   void handleMainScreen(String titles, String imagePaths) {
//     this.titles .value = titles;
//     this.imagePaths .value = imagePaths;
//   }
// }
