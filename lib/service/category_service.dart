import 'package:to_do_list/models/category.dart';
import 'package:to_do_list/repositories/repository.dart';

class CategoryService {
  Repository _repository;
  CategoryService(){
    _repository = Repository();
  }
  saveCategory(Category category) async {
    return await _repository.inSertData('categories', category.categoryMap());

  }
  readCategory () async {
    return await _repository.readData('categories');
  }
}