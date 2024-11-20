part of 'cart_cubit.dart';

class CartState extends Equatable {
  const CartState({
    this.groupValue = "Standerd",
    this.countItem = 1,
    this.isSelcted = 0,
    this.total = 0.0,
    this.index = 0,
    this.requestStatus = RequestStatus.initial,
    this.prodects = const [],
    this.count = const [],
    this.price = const [],
    this.isInternetConnect = true,
  });
  final RequestStatus requestStatus;
  final List<Product> prodects;
  final List<int> count;
  final List<double> price;
  final double total;
  final String groupValue;
  final int countItem;
  final int isSelcted;
  final int index;
  final bool isInternetConnect;
  CartState copyWith({
    List<int>? count,
    RequestStatus? requestStatus,
    List<Product>? prodects,
  double? total,
    int? index,
    bool? isInternetConnect,
    int? countItem,
    int? isSelcted,
    String? groupValue,
    List<double>? price,
  }) =>
      CartState(
        price: price??this.price,
        total:total??this.total,
        count: count ?? this.count,
        index: index ?? this.index,
        isSelcted: isSelcted ?? this.isSelcted,
        groupValue: groupValue ?? this.groupValue,
        countItem: countItem ?? this.countItem,
        requestStatus: requestStatus ?? this.requestStatus,
        isInternetConnect: isInternetConnect ?? this.isInternetConnect,
        prodects: prodects ?? this.prodects,
      );

  @override
  List<Object> get props => [
    total,
        count,
        price,
        requestStatus,
        isSelcted,
        prodects,
        countItem,
        isInternetConnect,
        groupValue,
        index,
      ];
}
