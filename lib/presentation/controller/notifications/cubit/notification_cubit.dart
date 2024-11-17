import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:first_app/presentation/ui/notifications/widgets/bottomshett_setting.dart';
import 'package:flutter/material.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(const NotificationState());
  void selcetItemToFilter(int index) {
    emit(state.copyWith(selectedfilter: index));
  }

  onTapSetting(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const BottomSheetSetting();
      },
    );
  }
}
