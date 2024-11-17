import 'package:first_app/data/model/result_api.dart';
import 'package:first_app/data/repository/cart_repo.dart';

class GetCartFromLocal {
  final CartRepo cartRepo;

  GetCartFromLocal(this.cartRepo);
  Future<ResultApi> getMycartLocal() async {
    return await cartRepo.cartFromLocal();
  }
}