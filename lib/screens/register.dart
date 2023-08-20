import 'package:flutter/material.dart';

import '../widgets/register/form/register_form.dart';
import '../widgets/register/register_app_bar.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            RegisterAppBar(),
            RegisterForm(),
          ],
        ),
      ),
    );
  }
}
