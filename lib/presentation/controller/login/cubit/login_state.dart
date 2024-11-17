part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
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
  final bool checkTerm;
  final RequestStatus requestStatus;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final String masegeState;
  final bool isIntenetConection;

  LoginState copyWith({
    bool? isIntenetConection,
    String? masegeState,
    bool? showPassword,
    bool? checkTerm,
    GlobalKey<FormState>? formKey,
    RequestStatus? requestStatus,
    TextEditingController? emailController,
    TextEditingController? passwordController,
  }) =>
      LoginState(
        isIntenetConection: isIntenetConection ?? this.isIntenetConection,
        checkTerm: checkTerm ?? this.checkTerm,
        masegeState: masegeState ?? this.masegeState,
        showPassword: showPassword ?? this.showPassword,
        requestStatus: requestStatus ?? this.requestStatus,
        formKey: formKey ?? this.formKey,
        emailController: emailController ?? this.emailController,
        passwordController: passwordController ?? this.passwordController,
      );

  @override
  List<Object> get props => [
        checkTerm,
        formKey,
        emailController,
        passwordController,
        isIntenetConection,
        requestStatus,
        showPassword,
        masegeState,
      ];
}
