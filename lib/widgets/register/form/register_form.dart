import 'package:flutter/material.dart';

import './register_form_title.dart';
import './register_form_input.dart';
import './register_form_button.dart';
import './register_form_instead.dart';

import '../../../screens/collection.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() {
    return _RegisterFormState();
  }
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isSignUpForm = true;
  String? _username;
  String? _password;
  String? _email;

  void _saveForm() {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CollectionScreen(),
      ),
    );
  }

  String? _validateUsername(String? username) {
    if (username == null || username.length < 4 || username.length > 50) {
      return "Four To Fifty Characters";
    }

    return null;
  }

  String? _validateEmail(String? email) {
    if (email == null || !email.contains("@gmail.com")) {
      return "Invalid Email Address";
    }

    return null;
  }

  String? _validatePassword(String? password) {
    if (password == null || password.length < 6) {
      return "Invalid Password";
    }

    return null;
  }

  void _saveUsername(String? username) {
    _username = username;
  }

  void _saveEmail(String? email) {
    _email = email;
  }

  void _savePassword(String? password) {
    _password = password;
  }

  void _switchForms() {
    setState(() => _isSignUpForm = !_isSignUpForm);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            RegisterFormTitle(
              heading: _isSignUpForm ? "Create Your" : "Login To Your",
            ),
            if (_isSignUpForm)
              RegisterFormInput(
                validateInput: _validateUsername,
                saveInput: _saveUsername,
                inputType: TextInputType.text,
                isProtected: false,
                label: "Username",
              ),
            if (_isSignUpForm)
              const SizedBox(
                height: 20,
              ),
            RegisterFormInput(
              validateInput: _validateEmail,
              saveInput: _saveEmail,
              inputType: TextInputType.emailAddress,
              isProtected: false,
              label: "Email",
            ),
            const SizedBox(
              height: 20,
            ),
            RegisterFormInput(
              validateInput: _validatePassword,
              saveInput: _savePassword,
              inputType: TextInputType.visiblePassword,
              isProtected: true,
              label: "Password",
            ),
            const SizedBox(
              height: 20,
            ),
            RegisterFormButton(
              saveForm: _saveForm,
              label: _isSignUpForm ? "Create Account" : "Login Account",
            ),
            const SizedBox(
              height: 20,
            ),
            RegisterFormInstead(
              switchForms: _switchForms,
              message:
                  _isSignUpForm ? "Have An Account?" : "Don't Have An Account?",
              label: _isSignUpForm ? "Login" : "Create",
            )
          ],
        ),
      ),
    );
  }
}
