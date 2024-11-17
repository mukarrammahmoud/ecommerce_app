part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState(

      {
        this.currentIndex = 0,
        this.selectedItemIndex = 0,
      this.isInternetConnect=false,
      this.category = const [],
      this.prodects = const [],
      this.cart = const [],
      this.valueDropDown,
      this.requestStatus = RequestStatus.initial});
  final int currentIndex;
  final int selectedItemIndex;
  final List<Prodects> prodects;
  final bool isInternetConnect;
  final List<Prodects> cart;
  final RequestStatus requestStatus;
  final List category;
  final String? valueDropDown;
  HomeState copyWith({
    int? currentIndex,
    int? selectedItemIndex,
    List? category,
    List<Prodects>? prodects,
    List<Prodects>? cart,
    RequestStatus? requestStatus,
    String? valueDropDown,
     bool? isInternetConnect,
  }) =>
      HomeState(
        selectedItemIndex: selectedItemIndex??this.selectedItemIndex,
        isInternetConnect: isInternetConnect??this.isInternetConnect,
        cart: cart ?? this.cart,
        category: category ?? this.category,
        valueDropDown: valueDropDown ?? this.valueDropDown,
        currentIndex: currentIndex ?? this.currentIndex,
        prodects: prodects ?? this.prodects,
        requestStatus: requestStatus ?? this.requestStatus,
      );
  @override
  List<dynamic> get props => [
        currentIndex,
        prodects,
        cart,
        requestStatus,
        valueDropDown,
        category,
        isInternetConnect,
        selectedItemIndex
      ];
}
