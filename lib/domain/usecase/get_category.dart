import 'package:first_app/data/model/result_api.dart';
import 'package:first_app/data/repository/cate_repo.dart';

class GetCategory {
  final CategoryRepo categoryRepo;

  GetCategory(this.categoryRepo);
  Future<ResultApi> fechCategory() async {
    return categoryRepo.getAllcategory();
  }
}