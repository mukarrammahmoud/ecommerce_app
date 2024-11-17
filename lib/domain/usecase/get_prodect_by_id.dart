import 'package:first_app/data/model/result_api.dart';
import 'package:first_app/data/repository/prodect_repo.dart';

class GetProdectById {
  final ProdectRepo prodectRepo;

  GetProdectById(this.prodectRepo);
  Future<ResultApi> fechProdectById(int id) async {
    return prodectRepo.getProdectByid(id);
  }
  Future<ResultApi> filterProdect(String categoryName) async {
    return prodectRepo.filtterProdect(categoryName);
  }
}
