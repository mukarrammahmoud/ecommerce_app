part of 'order_cubit.dart';

class OrderState extends Equatable {
  const OrderState({
    this.isInternetConnect = true,
    this.requestStatus = RequestStatus.initial,
    required this.controller,
  });
  final Completer<GoogleMapController> controller;
  final RequestStatus requestStatus;
  final bool isInternetConnect;

  OrderState copyWith({
    RequestStatus? requestStatus,
   bool? isInternetConnect,
    Completer<GoogleMapController>? controller,
  }) {
    return OrderState(
      isInternetConnect:isInternetConnect??this.isInternetConnect,
      controller: controller ?? this.controller,
      requestStatus: requestStatus ?? this.requestStatus,
    );
  }

  @override
  List<Object> get props => [
        controller,
        isInternetConnect,
        requestStatus,
      ];
}
