import 'package:fundoo/data/models/category.dart';

abstract class CategoryRepository {
  Future<List<Category>> getExpanseCategories();
  Future<List<Category>> getIncomeCategories();
}