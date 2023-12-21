import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CarouselImgController extends GetxController {
  RxList<String> carouselimgUrls = RxList<String>([]);

  @override
  void onInit() {
    super.onInit();
    fetchCarouselimgUrls();
  }

  //fetch banners
  Future<void> fetchCarouselimgUrls() async {
    try {
      QuerySnapshot carouselImgSnapshot =
      await FirebaseFirestore.instance.collection('carouselImg').get();


      if (carouselImgSnapshot.docs.isNotEmpty) {
        carouselimgUrls.value = carouselImgSnapshot.docs
            .map((doc) => doc['carouselimg'] as String)
            .toList();
      }
    } catch (e) {
      print("error: $e");
    }
  }
}