import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:first_app/core/root/app_route.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit()
      : super(ProfileState(
          phoneController: TextEditingController(),
          lastNameCoontroller: TextEditingController(),
          firstNameCoontroller: TextEditingController(),
          emailController: TextEditingController(),
        ));
  navigateToEditProfile(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoot.eidtProfile);
  }

  navigateToHistoryOrder(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoot.orderHistory);
  }
 @override
  Future<void> close() {
    state.emailController.dispose();
    state.firstNameCoontroller.dispose();
    state.lastNameCoontroller.dispose();
    state.phoneController.dispose();
    return super.close();
  }
  chooseImageFromCamera() async {
    XFile? xfile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (xfile == null) return;

    emit(state.copyWith(
      myFile: File(xfile.path),
    ));
  }
}
