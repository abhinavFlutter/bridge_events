import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AlleventsController {
  Stream<QuerySnapshot> getAlleventsStream() {
    return FirebaseFirestore.instance.collection('categories').snapshots();
  }

  Future<List<Map<String, dynamic>>> getProducts(String reference) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await FirebaseFirestore.instance
          .collection('categories')
          .doc(reference)
          .collection('products')
          .get();
      print(querySnapshot);

      return querySnapshot.docs.map((doc) => doc.data()).toList();
    } catch (error) {
      print('Error getting products: $error');
      return [];
    }
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final AlleventsController _alleventsController = AlleventsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _alleventsController.getAlleventsStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Text('No categories found');
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                QueryDocumentSnapshot<Object?> document =
                snapshot.data!.docs[index];
                Object? data = document.data();
                return ListTile(
                  title: Text('Document ID: ${document.id}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('All Fields: $data'),
                      FutureBuilder<List<Map<String, dynamic>>>(
                        future: _alleventsController.getProducts(document.id),
                        builder: (context, productsSnapshot) {
                          if (productsSnapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (productsSnapshot.hasError) {
                            return Text('Error: ${productsSnapshot.error}');
                          } else {
                            List<Map<String, dynamic>> products =
                            productsSnapshot.data!;
                            print(products);
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Products:'),
                                for (var product in products)

                                  Text('  - ${product['productName']}'),

                                // Adjust 'productName' based on your actual field name
                              ],
                            );
                          }
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
