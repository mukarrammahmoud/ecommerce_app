import 'package:first_app/core/constant/app_colors.dart';
import 'package:first_app/core/constant/app_image.dart';
import 'package:first_app/core/constant/components/custom_text.dart';
import 'package:first_app/core/root/app_route.dart';
import 'package:first_app/presentation/controller/profile/cubit/profile_cubit.dart';
import 'package:first_app/presentation/ui/profile/widgets/card_setting.dart';
import 'package:first_app/presentation/ui/profile/widgets/coins.dart';
import 'package:first_app/presentation/ui/home/widgets/custom_navigator_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(AppRoot.home, (route) => false);
        return false;
      },
      child: BlocProvider<ProfileCubit>(
        create: (context) => ProfileCubit(),
        child: Scaffold(
          appBar: AppBar(
            scrolledUnderElevation: 0,
            title: const AppText(
              text: "Profile",
              fontSize: 25,
              isBold: true,
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: BlocBuilder<ProfileCubit, ProfileState>(
                      builder: (context, state) {
                        return IconButton(
                          onPressed: () {
                            context
                                .read<ProfileCubit>()
                                .navigateToEditProfile(context);
                          },
                          icon: const Icon(
                            Icons.edit_note_sharp,
                            color: Colors.black,
                            size: 30,
                          ),
                        );
                      },
                    )),
                Center(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                  color: AppColor.priomaryColorApp, width: 3)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(120),
                            child: Image.asset(
                              AppImages.profile,
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        bottom: -10,
                        right: 40,
                        child: CircleAvatar(
                          backgroundColor: Colors.black,
                          child: Icon(
                            Icons.star,
                            color: AppColor.warrningColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const AppText(
                  text: "Mukarram",
                  fontSize: 25,
                  isBold: true,
                ),
                const SizedBox(
                  height: 5,
                ),
                AppText(
                  text: "Muka@gmail.com",
                  fontSize: 20,
                  textColor: AppColor.neutralsColor.withOpacity(0.5),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Coins(
                          icon: Icons.attach_money_sharp,
                          value: "39,4,00",
                          title: "Coins"),
                      Coins(
                        icon: Icons.verified_outlined,
                        title: "Voucher",
                        value: "120",
                      ),
                    ],
                  ),
                ),
                BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    return InkWell(
                      onTap: () {
                        context
                            .read<ProfileCubit>()
                            .navigateToHistoryOrder(context);
                      },
                      child: CardSetting(
                        icon: Icons.history,
                        widgetInMiddle: Column(
                          children: [
                            const AppText(
                              text: "Order History",
                              fontSize: 22,
                              isBold: true,
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              alignment: Alignment.topCenter,
                              decoration: BoxDecoration(
                                color: AppColor.errorColor.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const AppText(
                                text: " 2 Orders",
                                textColor: AppColor.errorColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                const CardSetting(
                  icon: Icons.settings,
                  widgetInMiddle: AppText(
                    text: "Setting and Prefrences",
                    isBold: true,
                    fontSize: 20,
                  ),
                ),
                const CardSetting(
                  icon: Icons.headphones,
                  widgetInMiddle: AppText(
                    text: "Customer Support",
                    isBold: true,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: const CusttomBottomNavigatorBar(),
        ),
      ),
    );
  }
}
