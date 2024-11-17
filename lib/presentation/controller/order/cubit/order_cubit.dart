import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:first_app/core/constant/functions/check_internet.dart';
import 'package:first_app/core/enum/enum_status.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit()
      : super(OrderState(
          controller: Completer<GoogleMapController>(),
        ));
  CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(15.341346, 44.167895),
    zoom: 16.4746,
  );
  checkIntenet() async {
    emit(state.copyWith(
      isInternetConnect: await chickIntrnet(),
    ));
  }

  onMapCreated(GoogleMapController controller) {
    Completer<GoogleMapController> cont = state.controller;
    cont.complete(controller);
    emit(state.copyWith(
      controller: cont,
    ));
  }
}
