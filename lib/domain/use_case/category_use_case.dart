import 'package:fundoo/data/models/category.dart';

import '../repository/category_repository_impl.dart';

class CategoryUseCase {
  Future<List<Category>> getExpanseCategories() async {
    return await CategoryRepositoryImpl().getExpanseCategories();
  }

  Future<List<Category>> getIncomeCategories() async {
    return await CategoryRepositoryImpl().getIncomeCategories();
  }
}