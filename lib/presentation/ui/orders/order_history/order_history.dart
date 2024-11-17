import 'package:first_app/presentation/ui/orders/widgets/custom_appbar.dart';
import 'package:first_app/presentation/ui/orders/widgets/order_history_body.dart';
import 'package:flutter/material.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Order History"),
      body: const OrderHistoryBody(),
    );
  }
}
