part of 'details_prodect_cubit.dart';

class DetailsProdectState extends Equatable {
  const DetailsProdectState({
    this.isReadMore = true,
    this.isIntenetConection = true,
    this.countItem = 1,
    this.selectedColorIndex = 0,
    this.cart = const [],
    this.requestStatus = RequestStatus.initial,
  });
  final bool isReadMore;
  final bool isIntenetConection;
  final int countItem;
  final int selectedColorIndex;
  final List<Prodects> cart;
  final RequestStatus requestStatus;
  @override
  List<Object> get props => [
        isReadMore,
        countItem,
        requestStatus,
        cart,
        selectedColorIndex,
      ];
  DetailsProdectState copyWith({
    bool? isReadMore,
    bool? isIntenetConection,
    int? countItem,
    int? selectedColorIndex,
    RequestStatus? requestStatus,
    List<Prodects>? cart,
  }) =>
      DetailsProdectState(
        selectedColorIndex: selectedColorIndex ?? this.selectedColorIndex,
        isIntenetConection: isIntenetConection ?? this.isIntenetConection,
        requestStatus: requestStatus ?? this.requestStatus,
        cart: cart ?? this.cart,
        countItem: countItem ?? this.countItem,
        isReadMore: isReadMore ?? this.isReadMore,
      );
}
