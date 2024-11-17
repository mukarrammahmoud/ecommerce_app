import 'package:first_app/data/model/result_api.dart';
import 'package:first_app/data/repository/cart_repo.dart';

class AddToCart {
  final CartRepo cartRepo;

  AddToCart(this.cartRepo);
  Future<ResultApi> addToMycart(Map data) async {
    return cartRepo.addCart(data);
  }
}
