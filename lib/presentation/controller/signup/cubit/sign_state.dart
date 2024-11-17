part of 'sign_cubit.dart';

class SignState extends Equatable {
  const SignState({
    required this.confirmPasswordController,
    required this.formKey,
    this.requestStatus = RequestStatus.initial,
    required this.emailController,
    required this.passwordController,
    this.masegeState = '',
    this.showPassword = true,
    this.checkTerm = false,
    this.isIntenetConection = true,
  });
  final GlobalKey<FormState> formKey;
  final bool showPassword;
  final bool isIntenetConection;

  final RequestStatus requestStatus;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final String masegeState;
  final bool checkTerm;

  SignState copyWith({
    String? masegeState,
    bool? showPassword,
    bool? checkTerm,
    TextEditingController? confirmPasswordController,
    GlobalKey<FormState>? formKey,
    RequestStatus? requestStatus,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    bool? isIntenetConection,
  }) =>
      SignState(
        isIntenetConection: isIntenetConection ?? this.isIntenetConection,
        checkTerm: checkTerm ?? this.checkTerm,
        confirmPasswordController:
            confirmPasswordController ?? this.confirmPasswordController,
        masegeState: masegeState ?? this.masegeState,
        showPassword: showPassword ?? this.showPassword,
        requestStatus: requestStatus ?? this.requestStatus,
        formKey: formKey ?? this.formKey,
        emailController: emailController ?? this.emailController,
        passwordController: passwordController ?? this.passwordController,
      );

  @override
  List<Object> get props => [
        formKey,
        isIntenetConection,
        emailController,
        passwordController,
        requestStatus,
        showPassword,
        checkTerm,
        masegeState,
      ];
}
