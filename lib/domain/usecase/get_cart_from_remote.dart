import 'package:first_app/data/model/result_api.dart';
import 'package:first_app/data/repository/cart_repo.dart';

class GetCartFromRemote {
  final CartRepo cartRepo;

  GetCartFromRemote(this.cartRepo);
  Future<ResultApi> fechCart() async {
    return cartRepo.getMyCart();
  }
}