part of 'category_of_prodect_cubit.dart';

class CategoryOfProdectState extends Equatable {
  const CategoryOfProdectState({
    this.prodects = const [],
    this.selectedItemIndex = 0,
    this.requestStatus = RequestStatus.initial,
  });
  final RequestStatus requestStatus;
  final List<Prodects> prodects;
  final int selectedItemIndex;

  @override
  List<Object> get props => [
        requestStatus,
        prodects,
        selectedItemIndex,
      ];
  CategoryOfProdectState copyWith({
    int? selectedItemIndex,
    RequestStatus? requestStatus,
    List<Prodects>? prodects,
  }) =>
      CategoryOfProdectState(
          selectedItemIndex: selectedItemIndex ?? this.selectedItemIndex,
          prodects: prodects ?? this.prodects,
          requestStatus: requestStatus ?? this.requestStatus);
}
