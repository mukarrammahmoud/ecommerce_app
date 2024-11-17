import 'package:first_app/core/constant/app_colors.dart';
import 'package:first_app/presentation/controller/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CusttomBottomNavigatorBar extends StatelessWidget {
  const CusttomBottomNavigatorBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return BottomNavigationBar(
          selectedItemColor: AppColor.priomaryColorApp,
          onTap: (val) {
            context.read<HomeCubit>().onTapBottmNavgitor(val, context);
          },
          currentIndex: state.currentIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: "Fav",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.card_travel),
              label: "Chat",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        );
      },
    );
  }
}
