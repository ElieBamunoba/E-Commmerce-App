//!In this file the function defined in the base_category_file are implemented

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/model.dart';
import 'base_product_reposity.dart';

class ProductRepository extends BaseProductRepository {
  //create an instace of the firebaseFirestore
  final FirebaseFirestore firebaseFirestore;
  //initialise the variable in the class constructor
  ProductRepository({FirebaseFirestore? firebaseFirestore})
      : firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;
  @override
  Stream<List<Product>> getAllProducts() {
    return firebaseFirestore.collection('products').snapshots().map(
      (snapShot) {
        return snapShot.docs
            .map(
              (doc) => Product.fromSnapshot(doc),
            )
            .toList();
      },
    );
  }
}
