import 'package:first_app/core/constant/components/custom_text.dart';
import 'package:first_app/core/root/app_route.dart';
import 'package:first_app/presentation/ui/cart/widgets/cart_body.dart';
import 'package:first_app/presentation/ui/home/widgets/custom_navigator_bar.dart';
import 'package:flutter/material.dart';

class MyCert extends StatelessWidget {
  const MyCert({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(AppRoot.home, (route) => false);
        return false;
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 244, 242, 242),
        appBar: AppBar(
          title: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(AppRoot.home);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                ),
              ),
              const AppText(
                text: "Cart",
                fontSize: 25,
                isBold: true,
              ),
            ],
          ),
        ),
        body: const CartBody(),
        bottomNavigationBar: const CusttomBottomNavigatorBar(),
      ),
    );
  }
}
