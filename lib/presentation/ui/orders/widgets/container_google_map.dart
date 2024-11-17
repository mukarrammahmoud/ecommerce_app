
import 'package:first_app/core/constant/app_colors.dart';
import 'package:first_app/presentation/controller/order/cubit/order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ContainerGoogleMap extends StatelessWidget {
  const ContainerGoogleMap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        return state.isInternetConnect == false
            ? const Center(
                child: Icon(
                  Icons.wifi_off_rounded,
                  color: AppColor.errorColor,
                ),
              )
            : Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 2,
                        color: AppColor.neutralsColor.withOpacity(.5)),
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(8),
                height: 250,
                child: GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: context.read<OrderCubit>().kGooglePlex,
                  onMapCreated: (GoogleMapController controller) {
                    context.read<OrderCubit>().onMapCreated(controller);
                  },
                ),
              );
      },
    );
  }
}