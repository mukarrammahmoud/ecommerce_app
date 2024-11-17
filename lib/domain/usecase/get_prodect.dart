import 'package:first_app/data/model/result_api.dart';
import 'package:first_app/data/repository/prodect_repo.dart';

class GetProdect {
  final ProdectRepo prodectRepo;

  GetProdect(this.prodectRepo);
  Future<ResultApi> fechProdect() async {
    return prodectRepo.getAllProdects();
  }
  Future<ResultApi> filterProdect(String categoryName) async {
    return prodectRepo.filtterProdect(categoryName);
  }
}
