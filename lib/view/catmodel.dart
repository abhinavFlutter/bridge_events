import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String categoryId;
  String pImage;
  String pId;
  Map<String, dynamic> referencedData;

  CategoryModel({
    required this.categoryId,
    required this.pImage,
    required this.pId,
    required this.referencedData,
  });

  factory CategoryModel.fromSnapshot(DocumentSnapshot document, DocumentSnapshot referenceDocument) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    Map<String, dynamic> referencedData = referenceDocument.data() as Map<String, dynamic>;

    return CategoryModel(
      categoryId: document.id,
      pImage: data['pimage'],
      pId: data['pid'],
      referencedData: referencedData,
    );
  }
}
