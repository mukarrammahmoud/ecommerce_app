import 'package:first_app/core/constant/app_colors.dart';
import 'package:first_app/core/constant/components/custom_button.dart';
import 'package:first_app/core/constant/components/custom_text.dart';
import 'package:first_app/core/enum/enum_status.dart';
import 'package:first_app/data/data_source/remote_data_source.dart';
import 'package:first_app/data/repository/login.dart';
import 'package:first_app/domain/usecase/login.dart';
import 'package:first_app/presentation/controller/login/cubit/login_cubit.dart';
import 'package:first_app/presentation/ui/login/widget/body_form.dart';
import 'package:first_app/presentation/ui/login/widget/log_fase_google.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<LoginCubit>(
        create: (context) => LoginCubit(
          loginUser: LoginUser(
            LoginRepo(RemoteDataSource()),
          ),
        ),
        child: const BodyLogin(),
      ),
    );
  }
}

class BodyLogin extends StatelessWidget {
  const BodyLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: AppText(
                  text: "WelCome Back !",
                  isBold: true,
                  fontSize: 25,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: AppText(
                  text: "Please Login Or Sign up to Continue our App",
                  isBold: true,
                  fontSize: 14,
                  textColor: AppColor.neutralsColor.withOpacity(0.5),
                ),
              ),
              const BodyForm(),
              Row(
                children: [
                  BlocSelector<LoginCubit, LoginState, bool>(
                    selector: (state) {
                      return state.checkTerm;
                    },
                    builder: (context, state) {
                      return Checkbox(
                        value: state,
                        onChanged: (value) {
                          context.read<LoginCubit>().changeCheckTerm();
                        },
                      );
                    },
                  ),
                  const AppText(
                    text: "Remember Me",
                    isBold: true,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * .1,
                  ),
                  const AppText(
                    text: "Forget Password ?",
                    isBold: true,
                    textColor: AppColor.priomaryColorApp,
                  ),
                ],
              ),
              BlocBuilder<LoginCubit, LoginState>(
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
              BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) {
                  return CustomButton(
                    color: AppColor.priomaryColorApp,
                    onPressed: () {
                      context.read<LoginCubit>().login(context);
                    },
                    title: state.requestStatus == RequestStatus.loading
                        ? const Center(
                            child: CircularProgressIndicator(
                                color: AppColor.splashColor),
                          )
                        : const AppText(
                            text: "Log In",
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
                  text: "Or Log in With ",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const LogFaseAndGoogle(),
              const SizedBox(
                height: 25,
              ),
              BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) {
                  return InkWell(
                    onTap: () {
                      context.read<LoginCubit>().navigateToSignUp(context);
                    },
                    child: const Center(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text: "Don`t Have Account ?",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                            TextSpan(
                                text: " Create account",
                                style: TextStyle(
                                    color: AppColor.priomaryColorApp,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16)),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
