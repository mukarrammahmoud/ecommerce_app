import 'package:first_app/core/constant/app_colors.dart';
import 'package:first_app/core/constant/components/costom_text_field.dart';
import 'package:first_app/core/constant/components/custom_text.dart';
import 'package:first_app/presentation/controller/signup/cubit/sign_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyForm extends StatelessWidget {
  const BodyForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignCubit, SignState>(
      builder: (context, state) {
        return Form(
          key: state.formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: AppText(
                  text: "Email",
                  textColor: AppColor.neutralsColor.withOpacity(0.5),
                ),
              ),
              CustomTextField(
                padding: 2,
                icon: const Icon(Icons.email_outlined),
                controller: state.emailController,
                hintText: "ReoprtExAMPL@gmail.com",
                isVissabileContent: false,
                keyboardType: TextInputType.emailAddress,
                validate: (val) {
                  val = val!.trim();
                  if (val.isEmpty) {
                    return "الحقل فارغ";
                  }

                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: AppText(
                  text: "User Name",
                  textColor: AppColor.neutralsColor.withOpacity(0.5),
                ),
              ),
              CustomTextField(
                padding: 7,
                icon: const Icon(Icons.lock),
                controller: state.passwordController,
                hintText: "User Name",
                isVissabileContent: false,
                keyboardType: TextInputType.visiblePassword,
                validate: (val) {
                  val = val!.trim();
                  if (val.isEmpty) {
                    return "الحقل فارغ";
                  }

                  return null;
                },
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: AppText(
                  text: " Password",
                  textColor: AppColor.neutralsColor.withOpacity(0.5),
                ),
              ),
              BlocSelector<SignCubit, SignState, bool>(selector: (state) {
                return state.showPassword;
              }, builder: (context, isShowPassWord) {
                return CustomTextField(
                  iconPrifex: IconButton(
                    icon: Icon(isShowPassWord
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () =>
                        context.read<SignCubit>().showHidePassword(),
                  ),
                  padding: 7,
                  icon: const Icon(Icons.lock),
                  controller: state.confirmPasswordController,
                  hintText: "xxxxxxxxxx",
                  isVissabileContent: state.showPassword,
                  keyboardType: TextInputType.visiblePassword,
                  validate: (val) {
                    val = val!.trim();
                    if (val.isEmpty) {
                      return "الحقل فارغ";
                    }

                    return null;
                  },
                );
              }),
            ],
          ),
        );
      },
    );
  }
}
