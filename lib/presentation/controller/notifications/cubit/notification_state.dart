part of 'notification_cubit.dart';

class NotificationState extends Equatable {
  const NotificationState({
    this.selectedfilter = 0,
  });
  final int selectedfilter;
  NotificationState copyWith({
    int? selectedfilter,
  }) =>
      NotificationState(
        selectedfilter: selectedfilter ?? this.selectedfilter,
      );
  @override
  List<Object> get props => [
        selectedfilter,
      ];
}
