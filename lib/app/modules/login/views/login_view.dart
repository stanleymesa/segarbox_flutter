import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:segarbox_flutter/theme/theme.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Image.asset(
                    'assets/image/logo_green_back.png',
                    width: Get.width,
                    height: 280,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 50,
                    child: AppBar(
                      backgroundColor: defaultWhite,
                      elevation: 2,
                      automaticallyImplyLeading: false,
                      bottom: TabBar(
                        unselectedLabelColor: Colors.grey,
                        labelColor: green,
                        indicatorColor: green,
                        labelStyle: title,
                        unselectedLabelStyle:
                            title.copyWith(fontWeight: FontWeight.normal),
                        tabs: [
                          Tab(
                            text: 'Login',
                          ),
                          Tab(
                            text: 'Sign Up',
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        LoginTab(controller: controller),
                        SignUpTab(controller: controller),
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                top: 268,
                child: Container(
                  width: Get.width,
                  height: 16,
                  decoration: BoxDecoration(
                      color: defaultWhite,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(16))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpTab extends StatelessWidget {
  const SignUpTab({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        children: [
          MyTextfield(
            label: 'Username',
            icon: Icon(
              Icons.person_pin_circle_rounded,
              color: (controller.isUsernameFocus.value) ? green : black,
              size: 18,
            ),
            focus: controller.usernameFocus,
            textEditingController: controller.usernameTextEditingController,
          ),
          SizedBox(
            height: 16,
          ),
          MyTextfield(
            label: 'Email',
            icon: Icon(
              Icons.email_rounded,
              color: (controller.isEmailSignUpFocus.value) ? green : black,
              size: 18,
            ),
            focus: controller.emailSignUpFocus,
            textEditingController: controller.emailSignUpTextEditingController,
          ),
          SizedBox(
            height: 16,
          ),
          MyTextfield(
            label: 'Phone Number',
            icon: Icon(
              Icons.phone_rounded,
              color: (controller.isPhoneFocus.value) ? green : black,
              size: 18,
            ),
            focus: controller.phoneFocus,
            textEditingController: controller.phoneTextEditingController,
          ),
          SizedBox(
            height: 16,
          ),
          MyTextfield(
            label: 'Password',
            icon: Icon(
              Icons.lock_rounded,
              color: (controller.isPasswordSignUpFocus.value) ? green : black,
              size: 18,
            ),
            focus: controller.passwordSignUpFocus,
            textEditingController:
                controller.passwordSignUpTextEditingController,
          ),
          SizedBox(
            height: 16,
          ),
          MyTextfield(
            label: 'Password Confirmation',
            icon: Icon(
              Icons.lock_rounded,
              color:
                  (controller.isConPasswordSignUpFocus.value) ? green : black,
              size: 18,
            ),
            focus: controller.conPasswordSignUpFocus,
            textEditingController:
                controller.conPasswordSignUpTextEditingController,
          ),
          SizedBox(
            height: 48,
          ),
          ElevatedButton(
            onPressed: () async {
              final token = await controller.getToken();
              Get.snackbar('TOKEN', token);
            },
            child: Text(
              'Sign Up',
              style: title.copyWith(color: defaultWhite),
            ),
            style: ElevatedButton.styleFrom(
                backgroundColor: green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)))),
          )
        ],
      ),
    );
  }
}

class LoginTab extends StatelessWidget {
  const LoginTab({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          controller.emailFocus.unfocus();
          controller.passwordFocus.unfocus();
        },
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          children: [
            MyTextfield(
              label: 'Email',
              icon: Icon(
                Icons.email_rounded,
                color: (controller.isEmailFocus.value) ? green : black,
                size: 18,
              ),
              focus: controller.emailFocus,
              textEditingController: controller.emailTextEditingController,
            ),
            SizedBox(
              height: 16,
            ),
            MyTextfield(
              label: 'Password',
              icon: Icon(
                Icons.password_rounded,
                color: (controller.isPasswordFocus.value) ? green : black,
                size: 18,
              ),
              focus: controller.passwordFocus,
              textEditingController: controller.passwordTextEditingController,
            ),
            SizedBox(
              height: 48,
            ),
            ElevatedButton(
              onPressed: () {
                controller.saveToken('TOKEN INI BOSS');
                Get.back();
              },
              child: Text(
                'Login',
                style: title.copyWith(color: defaultWhite),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)))),
            )
          ],
        ),
      ),
    );
  }
}

class MyTextfield extends StatelessWidget {
  const MyTextfield({
    Key? key,
    required this.label,
    required this.icon,
    required this.focus,
    required this.textEditingController,
  }) : super(key: key);

  final String label;
  final Icon icon;
  final FocusNode focus;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: green,
      style: normalDark.copyWith(color: green),
      focusNode: focus,
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: label,
        hintStyle: normalDark,
        prefixIcon: icon,
        contentPadding: EdgeInsets.symmetric(horizontal: 0),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: green),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: black),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      ),
    );
  }
}
