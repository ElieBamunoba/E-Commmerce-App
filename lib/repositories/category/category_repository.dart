//!In this file the function defined in the base_category_file are implemented

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/model.dart';
import 'base_category_repository.dart';

class CategoryRepository extends BaseCategoryRepository {
  //create an instace of the firebaseFirestore
  final FirebaseFirestore firebaseFirestore;
  //initialise the variable in the class constructor
  CategoryRepository({FirebaseFirestore? firebaseFirestore})
      : firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;
  @override
  Stream<List<Category>> getAllCategories() {
    return firebaseFirestore.collection('categories').snapshots().map(
      (snapShot) {
        return snapShot.docs
            .map(
              (doc) => Category.fromSnapshot(doc),
            )
            .toList();
      },
    );
  }
}
