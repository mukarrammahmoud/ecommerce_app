part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  const ProfileState({
    this.myFile,
    required  this.firstNameCoontroller,
    required  this.lastNameCoontroller,
    required  this.emailController,
    required  this.phoneController,
  });
  final File? myFile;
  final TextEditingController firstNameCoontroller;
  final TextEditingController emailController;
  final TextEditingController lastNameCoontroller;
  final TextEditingController phoneController;
  ProfileState copyWith({
    File? myFile,
       TextEditingController? firstNameCoontroller,
   TextEditingController? lastNameCoontroller,
   TextEditingController? emailController,
   TextEditingController? phoneController,
  }) {
    return ProfileState(
      phoneController: phoneController??this.phoneController,
lastNameCoontroller: lastNameCoontroller??this.lastNameCoontroller,
firstNameCoontroller: firstNameCoontroller??this.firstNameCoontroller,
      myFile: myFile ?? this.myFile,
      emailController:emailController??this.emailController
    );
  }

  @override
  List<dynamic> get props => [
        myFile,
        emailController,
        firstNameCoontroller,
        lastNameCoontroller,
        phoneController,
      ];
}
