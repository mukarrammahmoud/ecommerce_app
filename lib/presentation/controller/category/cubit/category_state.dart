part of 'category_cubit.dart';

class CategoryState extends Equatable {
  const CategoryState({
    this.selectedfilter = 0,
    this.rangeValue = const RangeValues(20.3, 70.0),
    this.selectedfilterBrands = 0,
    this.selectedColorIndex = 0,
    this.prodects = const [],
    this.cate = const [],
    this.category = const [],
    this.requestStatus = RequestStatus.initial,
  });
  final RequestStatus requestStatus;
  final List<Prodects> prodects;
  final List cate;
  final List category;
  final int selectedfilter;
  final RangeValues rangeValue;
  final int selectedfilterBrands;
  final int selectedColorIndex;

  @override
  List<Object> get props => [
        cate,
        rangeValue,
        requestStatus,
        category,
        prodects,
        selectedfilter,
        selectedfilterBrands,
        selectedColorIndex,
      ];
  CategoryState copyWith({
    List? cate,
    RequestStatus? requestStatus,
    List<Prodects>? prodects,
    int? selectedfilter,
    int? selectedfilterBrands,
    int? selectedColorIndex,
    RangeValues? rangeValue,
    List? category,
  }) =>
      CategoryState(
          category: category ?? this.category,
          cate: cate ?? this.cate,
          rangeValue: rangeValue ?? this.rangeValue,
          selectedColorIndex: selectedColorIndex ?? this.selectedColorIndex,
          selectedfilterBrands:
              selectedfilterBrands ?? this.selectedfilterBrands,
          selectedfilter: selectedfilter ?? this.selectedfilter,
          prodects: prodects ?? this.prodects,
          requestStatus: requestStatus ?? this.requestStatus);
}
