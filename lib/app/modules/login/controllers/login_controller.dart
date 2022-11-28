import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // Login Section
  // Email
  final emailFocus = FocusNode();
  final isEmailFocus = false.obs;
  final emailTextEditingController = TextEditingController();

  // Password
  final passwordFocus = FocusNode();
  final isPasswordFocus = false.obs;
  final passwordTextEditingController = TextEditingController();

  // Sign Up Section
  // Username
  final usernameFocus = FocusNode();
  final isUsernameFocus = false.obs;
  final usernameTextEditingController = TextEditingController();

  // Email Sign Up
  final emailSignUpFocus = FocusNode();
  final isEmailSignUpFocus = false.obs;
  final emailSignUpTextEditingController = TextEditingController();

  // Phone Sign Up
  final phoneFocus = FocusNode();
  final isPhoneFocus = false.obs;
  final phoneTextEditingController = TextEditingController();

  // Password Sign Up
  final passwordSignUpFocus = FocusNode();
  final isPasswordSignUpFocus = false.obs;
  final passwordSignUpTextEditingController = TextEditingController();

  // Confirmation Password Sign Up
  final conPasswordSignUpFocus = FocusNode();
  final isConPasswordSignUpFocus = false.obs;
  final conPasswordSignUpTextEditingController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    emailFocus.addListener(() {
      (emailFocus.hasFocus)
          ? isEmailFocus.value = true
          : isEmailFocus.value = false;
    });

    passwordFocus.addListener(() {
      (passwordFocus.hasFocus)
          ? isPasswordFocus.value = true
          : isPasswordFocus.value = false;
    });

    usernameFocus.addListener(() {
      (usernameFocus.hasFocus)
          ? isUsernameFocus.value = true
          : isUsernameFocus.value = false;
    });

    emailSignUpFocus.addListener(() {
      (emailSignUpFocus.hasFocus)
          ? isEmailSignUpFocus.value = true
          : isEmailSignUpFocus.value = false;
    });

    phoneFocus.addListener(() {
      (phoneFocus.hasFocus)
          ? isPhoneFocus.value = true
          : isPhoneFocus.value = false;
    });

    passwordSignUpFocus.addListener(() {
      (passwordSignUpFocus.hasFocus)
          ? isPasswordSignUpFocus.value = true
          : isPasswordSignUpFocus.value = false;
    });

    conPasswordSignUpFocus.addListener(() {
      (conPasswordSignUpFocus.hasFocus)
          ? isConPasswordSignUpFocus.value = true
          : isConPasswordSignUpFocus.value = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
    emailFocus.dispose();
    emailTextEditingController.dispose();

    passwordFocus.dispose();
    passwordTextEditingController.dispose();

    usernameFocus.dispose();
    usernameTextEditingController.dispose();

    emailSignUpFocus.dispose();
    emailSignUpTextEditingController.dispose();

    phoneFocus.dispose();
    phoneTextEditingController.dispose();

    passwordSignUpFocus.dispose();
    passwordSignUpTextEditingController.dispose();

    conPasswordSignUpFocus.dispose();
    conPasswordSignUpTextEditingController.dispose();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
