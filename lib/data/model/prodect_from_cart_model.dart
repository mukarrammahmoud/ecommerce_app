import 'package:first_app/domain/entities/prodect_from_cart.dart';

class ProdectFromCartModel extends ProdectFromCart {
  ProdectFromCartModel({
    required super.prodectId,
    required super.quantity,
  });
  factory ProdectFromCartModel.fromJson(Map<String, dynamic> json) {
    return ProdectFromCartModel(
        prodectId: json['productId'], quantity: json['quantity']);
  }
}
