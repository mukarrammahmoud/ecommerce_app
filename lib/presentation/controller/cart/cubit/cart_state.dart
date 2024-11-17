part of 'cart_cubit.dart';

class CartState extends Equatable {
  const CartState({
    this.groupValue = "Standerd",
    this.countItem = 1,
    this.requestStatus = RequestStatus.initial,
    this.prodects = const [],
    this.isInternetConnect = true,
  });
  final RequestStatus requestStatus;
  final List<ProdectFromCart> prodects;
  final String groupValue;
  final int countItem;
  final bool isInternetConnect;
  CartState copyWith({
    RequestStatus? requestStatus,
    List<ProdectFromCart>? prodects,
    bool? isInternetConnect,
    int? countItem,
    String? groupValue,
  }) =>
      CartState(
        groupValue: groupValue ?? this.groupValue,
        countItem: countItem ?? this.countItem,
        requestStatus: requestStatus ?? this.requestStatus,
        isInternetConnect: isInternetConnect ?? this.isInternetConnect,
        prodects: prodects ?? this.prodects,
      );

  @override
  List<Object> get props => [
        requestStatus,
        prodects,
        countItem,
        isInternetConnect,
        groupValue,
      ];
}
