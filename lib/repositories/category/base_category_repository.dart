//!in this file all avaible functions of the repository are defined and which type of data is returned

import '../../models/model.dart';

abstract class BaseCategoryRepository {
  Stream<List<Category>> getAllCategories();
}
