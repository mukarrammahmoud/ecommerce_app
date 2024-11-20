import 'package:first_app/core/constant/app_colors.dart';
import 'package:first_app/core/constant/components/costom_text_field.dart';
import 'package:first_app/core/constant/components/custom_text.dart';
import 'package:first_app/presentation/controller/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyForm extends StatelessWidget {
  const BodyForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Form(
          key: state.formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: AppText(
                    text: "Email",
                    isBold: true,
                    textColor: AppColor.neutralsColor.withOpacity(0.5),
                  ),
                ),
              ),
              CustomTextField(
                
                icon: const Icon(Icons.email_outlined),
                controller: state.emailController,
                hintText: "mor_2314",
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: AppText(
                    text: "Password",
                    isBold: true,
                    textColor: AppColor.neutralsColor.withOpacity(0.5),
                  ),
                ),
              ),
              BlocSelector<LoginCubit, LoginState, bool>(selector: (state) {
                return state.showPassword;
              }, builder: (context, isShowPassWord) {
                return CustomTextField(
                  iconPrifex: IconButton(
                    icon: Icon(isShowPassWord
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () =>
                        context.read<LoginCubit>().showHidePassword(),
                  ),
                  icon: const Icon(Icons.lock),
                  controller: state.passwordController,
                  hintText: "83r5^_",
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
