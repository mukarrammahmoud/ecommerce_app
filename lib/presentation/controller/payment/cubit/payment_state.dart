part of 'payment_cubit.dart';

class PaymentState extends Equatable {
  const PaymentState({
    this.isInternetConnect = true,
    this.groupValue = 'visa',
    this.currentIndex = 0,
  });
  final bool isInternetConnect;
  final String groupValue;
  final int currentIndex;
  @override
  List<Object> get props => [
        groupValue,
        isInternetConnect,
        currentIndex,
      ];
  PaymentState copyWith({
    bool? isInternetConnect,
    String? groupValue,
    int? currentIndex,
  }) =>
      PaymentState(
        isInternetConnect: isInternetConnect ?? this.isInternetConnect,
        groupValue: groupValue ?? this.groupValue,
        currentIndex: currentIndex ?? this.currentIndex,
      );
}
