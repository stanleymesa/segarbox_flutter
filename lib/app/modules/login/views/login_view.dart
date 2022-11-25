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
                        LoginTab(),
                        SignUpTab(),
                      ],
                    ),
                  )
                ],
              ),
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      children: [
        MyTextfield(
          label: 'Username',
          icon: Icon(
            Icons.person_pin_circle_rounded,
            color: black,
            size: 18,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        MyTextfield(
          label: 'Email',
          icon: Icon(
            Icons.email_rounded,
            color: black,
            size: 18,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        MyTextfield(
          label: 'Phone Number',
          icon: Icon(
            Icons.phone_rounded,
            color: black,
            size: 18,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        MyTextfield(
          label: 'Password',
          icon: Icon(
            Icons.lock_rounded,
            color: black,
            size: 18,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        MyTextfield(
          label: 'Password Confirmation',
          icon: Icon(
            Icons.lock_rounded,
            color: black,
            size: 18,
          ),
        ),
        SizedBox(
          height: 48,
        ),
        ElevatedButton(
          onPressed: () {},
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
    );
  }
}

class LoginTab extends StatelessWidget {
  const LoginTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      children: [
        MyTextfield(
          label: 'Email',
          icon: Icon(
            Icons.email_rounded,
            color: black,
            size: 18,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        MyTextfield(
          label: 'Password',
          icon: Icon(
            Icons.password_rounded,
            color: black,
            size: 18,
          ),
        ),
        SizedBox(
          height: 48,
        ),
        ElevatedButton(
          onPressed: () {},
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
    );
  }
}

class MyTextfield extends StatelessWidget {
  const MyTextfield({
    Key? key,
    required this.label,
    required this.icon,
  }) : super(key: key);

  final String label;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: green,
      style: normalDark.copyWith(color: green),
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
