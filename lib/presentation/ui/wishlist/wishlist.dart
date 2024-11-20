import 'package:first_app/core/constant/components/custom_text.dart';
import 'package:first_app/core/root/app_route.dart';
import 'package:first_app/presentation/ui/home/widgets/custom_navigator_bar.dart';
import 'package:first_app/presentation/ui/wishlist/widget/card_wishlist.dart';
import 'package:flutter/material.dart';

class WishList extends StatelessWidget {
  const WishList({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(AppRoot.home, (route) => false);

        return false;
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(240, 255, 255, 255),
        appBar: AppBar(
          scrolledUnderElevation: 0,
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
                text: "WishList",
                fontSize: 25,
                isBold: true,
              ),
            ],
          ),
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return const CardWishList();
          },
        ),
        bottomNavigationBar: const CusttomBottomNavigatorBar(),
      ),
    );
  }
}
