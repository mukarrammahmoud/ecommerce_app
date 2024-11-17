part of 'search_cubit.dart';

class SearchState extends Equatable {
  const SearchState({
    this.prodects = const [],
    this.category = const [],
    this.valueDropDown ,
    this.requestStatus = RequestStatus.initial,
  });
  final RequestStatus requestStatus;
  final List<Prodects> prodects;
  final List category;
  final String? valueDropDown;
  @override
  List<dynamic> get props => [
        requestStatus,
        prodects,
        category,
        valueDropDown
      ];
  SearchState copyWith({
    RequestStatus? requestStatus,
    List<Prodects>? prodects,
    List? category,
     String? valueDropDown,
  }) =>
      SearchState(
valueDropDown: valueDropDown??this.valueDropDown,
          category: category ?? this.category,
          prodects: prodects ?? this.prodects,
          requestStatus: requestStatus ?? this.requestStatus);
}
