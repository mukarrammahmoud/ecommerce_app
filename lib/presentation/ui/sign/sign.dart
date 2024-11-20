import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:first_app/core/constant/app_colors.dart';
import 'package:first_app/core/constant/components/custom_button.dart';
import 'package:first_app/core/constant/components/custom_text.dart';
import 'package:first_app/core/constant/custom_dialog.dart';
import 'package:first_app/core/enum/enum_status.dart';
import 'package:first_app/core/root/app_route.dart';
import 'package:first_app/data/data_source/remote_data_source.dart';
import 'package:first_app/data/repository/user_repo.dart';
import 'package:first_app/domain/usecase/add_user.dart';
import 'package:first_app/presentation/controller/signup/cubit/sign_cubit.dart';
import 'package:first_app/presentation/ui/sign/widget/body_form.dart';
import 'package:first_app/presentation/ui/login/widget/log_fase_google.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Sign extends StatelessWidget {
  const Sign({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignCubit>(
      create: (context) => SignCubit(
          addUser: AddUser(UserRepo(
        RemoteDataSource(),
      ))),
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: AppText(
                          text: "Create Account",
                          isBold: true,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: AppText(
                          text: "Create new account",
                          isBold: true,
                          fontSize: 14,
                          textColor: AppColor.neutralsColor.withOpacity(0.5),
                        ),
                      ),
                    ),
                    const BodyForm(),
                    Row(
                      children: [
                        BlocSelector<SignCubit, SignState, bool>(
                          selector: (state) {
                            return state.checkTerm;
                          },
                          builder: (context, state) {
                            return Checkbox(
                              value: state,
                              onChanged: (value) {
                                context.read<SignCubit>().changeCheckTerm();
                              },
                            );
                          },
                        ),
                        const Expanded(
                          child: SizedBox(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "I agree to the ",
                                  ),
                                  TextSpan(
                                    text: "Term of Conditions ",
                                    style: TextStyle(
                                      color: AppColor.priomaryColorApp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "And ",
                                    style: TextStyle(),
                                  ),
                                  TextSpan(
                                    text: "Privacy Policy ",
                                    style: TextStyle(
                                        color: AppColor.priomaryColorApp),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    BlocConsumer<SignCubit, SignState>(
                      listenWhen: (previous, current) {
                        return previous.isIntenetConection !=
                                current.isIntenetConection ||
                            previous.requestStatus != current.requestStatus;
                      },
                      listener: (context, state) {
                        if (state.requestStatus == RequestStatus.successful) {
                          customDialog(
                            context: context,
                            title: 'Create Account',
                            description: 'Created Account Successfuly',
                            btnOkOnPress: () {
                              Navigator.of(context).pushReplacementNamed(
                                AppRoot.login,
                              );
                            },
                          ).show();
                        }
                        if (state.isIntenetConection == false) {
                          customDialog(
                                  dialogType: DialogType.error,
                                  context: context,
                                  title: "No Conniction",
                                  description:
                                      "Check The Internet And Try Again",
                                  btnOkOnPress: () {})
                              .show();
                        }
                      },
                      builder: (context, state) {
                        return SizedBox(
                          height: 20,
                          child: state.isIntenetConection == false
                              ? const Center(
                                  child: AppText(
                                    text: 'No Internet Connection',
                                    textColor: AppColor.errorColor,
                                  ),
                                )
                              : (state.requestStatus == RequestStatus.error
                                  ? const Center(
                                      child: AppText(
                                        text: 'User is Not Exit',
                                        textColor: AppColor.errorColor,
                                      ),
                                    )
                                  : const AppText(text: '')),
                        );
                      },
                    ),
                    BlocBuilder<SignCubit, SignState>(
                      builder: (context, state) {
                        return CustomButton(
                          color: state.checkTerm == true
                              ? AppColor.priomaryColorApp
                              : AppColor.neutralsColor.withOpacity(0.2),
                          onPressed: () {
                            if (state.checkTerm == true) {
                              context.read<SignCubit>().signUp(context);
                            }
                          },
                          title: state.requestStatus == RequestStatus.loading
                              ? const Center(
                                  child: CircularProgressIndicator(
                                      color: AppColor.splashColor),
                                )
                              : const AppText(
                                  text: "Create Account ",
                                  textColor: AppColor.splashColor,
                                  isBold: true,
                                ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Align(
                      alignment: Alignment.center,
                      child: AppText(
                        text: "Or Create With ",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const LogFaseAndGoogle(),
                    const SizedBox(
                      height: 25,
                    ),
                    BlocBuilder<SignCubit, SignState>(
                      builder: (context, state) {
                        return InkWell(
                          onTap: () {
                            context.read<SignCubit>().navigateToLogin(context);
                          },
                          child: const Center(
                            child: Text.rich(TextSpan(children: [
                              TextSpan(
                                  text: "Already Have Account ? ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                              TextSpan(
                                  text: "Log in",
                                  style: TextStyle(
                                      color: AppColor.priomaryColorApp,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                            ])),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
