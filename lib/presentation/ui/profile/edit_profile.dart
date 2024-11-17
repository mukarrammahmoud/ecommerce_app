import 'package:country_list_pick/country_list_pick.dart';
import 'package:first_app/core/constant/app_colors.dart';
import 'package:first_app/core/constant/app_image.dart';
import 'package:first_app/core/constant/components/bottom_row_buttons.dart';
import 'package:first_app/core/constant/components/custom_text.dart';
import 'package:first_app/presentation/controller/profile/cubit/profile_cubit.dart';
import 'package:first_app/presentation/ui/profile/widgets/customtext_field_with_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constant/components/custom_button.dart';

class EditProfle extends StatelessWidget {
  const EditProfle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileCubit>(
      create: (context) => ProfileCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const AppText(
            text: 'Edit Profile',
            fontSize: 25,
            isBold: true,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 4,
              child: ListView(
                children: [
                  Center(
                    child: Stack(
                      children: [
                        Positioned(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(200),
                                border: Border.all(
                                    color: AppColor.priomaryColorApp,
                                    width: 3)),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(200),
                                  child:
                                      BlocBuilder<ProfileCubit, ProfileState>(
                                    builder: (context, state) {
                                      return Column(
                                        children: [
                                          state.myFile == null
                                              ? Image.asset(
                                                  AppImages.profile,
                                                  width: 150,
                                                  height: 100,
                                                  fit: BoxFit.cover,
                                                )
                                              : Image.file(
                                                  state.myFile!,
                                                  width: 150,
                                                  height: 100,
                                                  fit: BoxFit.cover,
                                                ),
                                          Container(
                                              color: AppColor.splashColor,
                                              child: IconButton(
                                                onPressed: () {
                                                  context
                                                      .read<ProfileCubit>()
                                                      .chooseImageFromCamera();
                                                },
                                                icon: const Icon(
                                                  Icons.camera_alt_outlined,
                                                  size: 30,
                                                ),
                                              )),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      return Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              child: CustomTextFieldWithTitle(
                                  hint: 'First Name',
                                  textEditingController:
                                      state.firstNameCoontroller,
                                  title: "First Name"),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              child: CustomTextFieldWithTitle(
                                  hint: 'Last Name',
                                  textEditingController:
                                      state.lastNameCoontroller,
                                  title: "Last Name"),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  // const TextFieldMyName(),
                  BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      return CustomTextFieldWithTitle(
                        hint: 'muka@gmail.com',
                        textEditingController: state.emailController,
                        title: "Email",
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: AppText(
                        text: "Country",
                        isBold: true,
                        textColor: AppColor.neutralsColor.withOpacity(0.5),
                      ),
                    ),
                  ),
                  CustomButton(
                    colorBorder: AppColor.neutralsColor.withOpacity(0.5),
                    color: AppColor.splashColor,
                    onPressed: () {},
                    title: CountryListPick(
                        theme: CountryTheme(
                          alphabetTextColor: AppColor.successColor,
                          labelColor: AppColor.priomaryColorApp,
                          isShowFlag: true,
                          isShowTitle: true,
                          isShowCode: true,
                          isDownIcon: true,
                          showEnglishName: true,
                        ),
                        initialSelection: '+967',
                        onChanged: (CountryCode? code) {},
                        useUiOverlay: true,
                        useSafeArea: false),
                  ),
                  BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      return CustomTextFieldWithTitle(
                        hint: '79338292-44',
                        textEditingController: state.phoneController,
                        title: "Phone Number",
                      );
                    },
                  ),
                ],
              ),
            ),
            BottomRowButtons(
                onPressedOne: () {},
                onPressedTow: () {},
                textOne: 'Cancel',
                textOTow: "Update")
          ],
        ),
      ),
    );
  }
}
