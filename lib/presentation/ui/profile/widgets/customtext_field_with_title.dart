
import 'package:first_app/core/constant/app_colors.dart';
import 'package:first_app/core/constant/components/costom_text_field.dart';
import 'package:first_app/core/constant/components/custom_text.dart';
import 'package:first_app/presentation/controller/profile/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTextFieldWithTitle extends StatelessWidget {
  const CustomTextFieldWithTitle({
    required this.hint,
    required this.textEditingController,
    required this.title,
    super.key,
  });
  final TextEditingController textEditingController;
  final String hint;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: AppText(
              text: title,
              isBold: true,
              textColor: AppColor.neutralsColor.withOpacity(0.5),
            ),
          ),
        ),
        CustomTextField(
            hintText: hint,
            isVissabileContent: false,
            validate: (val) {
              return null;
            },
            controller: textEditingController),
      ],
    );
  }
}

class TextFieldMyName extends StatelessWidget {
  const TextFieldMyName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  const AppText(text: "First Name"),
                  CustomTextField(
                      hintText: "Mukaram",
                      isVissabileContent: false,
                      validate: (val) {
                        return null;
                      },
                      controller: state.firstNameCoontroller)
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  const AppText(text: "Last Name"),
                  CustomTextField(
                      hintText: "Mahmoud",
                      isVissabileContent: false,
                      validate: (val) {
                        return null;
                      },
                      controller: state.lastNameCoontroller)
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
