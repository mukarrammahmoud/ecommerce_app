import 'package:first_app/core/constant/app_colors.dart';
import 'package:first_app/core/constant/app_image.dart';
import 'package:first_app/presentation/controller/order/cubit/order_cubit.dart';
import 'package:first_app/presentation/ui/orders/widgets/container_details_details.dart';
import 'package:first_app/presentation/ui/orders/widgets/container_google_map.dart';
import 'package:first_app/presentation/ui/orders/widgets/container_location_details.dart';
import 'package:first_app/presentation/ui/orders/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderTracking extends StatelessWidget {
  const OrderTracking({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrderCubit>(
      create: (context) => OrderCubit(),
      child: Scaffold(
        appBar: customAppBar(title: 'Order Tracking'),
        body: ListView(
          children: [
            SizedBox(
              height: 80,
              child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: AppColor.successColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Image.asset(
                      AppImages.shirt,
                      fit: BoxFit.cover,
                      height: 60,
                      width: 60,
                    ),
                  );
                },
              ),
            ),
            const ContainerDetailsOrder(),
            const ContainerGoogleMap(),
            ContainerLocationDetails(
              title: "Mukarram",
              subTile: "Id # 2983",
              trailing: const CircleAvatar(
                backgroundColor: AppColor.priomaryColorApp,
                child: Icon(
                  Icons.call,
                  color: AppColor.successColor,
                ),
              ),
              leading: Image.asset(
                AppImages.profile,
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
