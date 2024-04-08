import 'package:coffee/firebase/firebase_helper.dart';
import 'package:coffee/models/user_model.dart';
import 'package:coffee/screens/login_and_signup/signup/widgets/signup_google.dart';
import 'package:coffee/theme/colors.dart';
import 'package:coffee/widgets/text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupForm extends StatelessWidget {
  SignupForm({super.key});

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        height: MediaQuery.sizeOf(context).height,
        color: ThemeColor.primary,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ..._formHeader(context),
              _fullName,
              const SizedBox(
                height: 16,
              ),
              _emailField,
              const SizedBox(height: 16),
              _passwordField,
              const SizedBox(height: 32),
              _createAccountButton(context),
              const SizedBox(height: 16),
              const GoogleSignup(),
              const SizedBox(height: 8),
              _haveAccount(context),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _formHeader(BuildContext context) {
    return [
      TextWidget(
        text: 'Hii There,',
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: ThemeColor.text,
              fontWeight: FontWeight.w700,
            ),
      ),
      const SizedBox(height: 8),
      TextWidget(
        text: 'Please fill details to create account',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: ThemeColor.lightWhite,
              fontWeight: FontWeight.w500,
            ),
      ),
      const SizedBox(height: 36),
    ];
  }

  get _fullName => TextFormField(
        controller: _fullNameController,
        style: const TextStyle(color: Colors.white),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your name.';
          }
          return null;
        },
        decoration: InputDecoration(
          labelStyle: TextStyle(
            color: ThemeColor.lightWhite,
          ),
          labelText: "Full Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: ThemeColor.text),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: ThemeColor.text),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: ThemeColor.text),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        ),
      );

  get _emailField => TextFormField(
        style: const TextStyle(color: Colors.white),
        controller: _emailController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your email address.';
          }
          return null;
        },
        decoration: InputDecoration(
            labelStyle: TextStyle(
              color: ThemeColor.lightWhite,
            ),
            labelText: "Email address",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: ThemeColor.text),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: ThemeColor.text),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: ThemeColor.text),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 16)),
      );

  get _passwordField => TextFormField(
        style: const TextStyle(color: Colors.white),
        obscureText: true,
        controller: _passwordController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your password.';
          }
          return null;
        },
        decoration: InputDecoration(
          labelStyle: TextStyle(
            color: ThemeColor.lightWhite,
          ),
          labelText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: ThemeColor.text),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: ThemeColor.text),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: ThemeColor.text),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ),
        ),
      );

  _createAccountButton(BuildContext context) {
    return FilledButton(
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          try {
            UserCredential credential = await FirebaseAuth.instance
                .createUserWithEmailAndPassword(
                    email: _emailController.text,
                    password: _passwordController.text);
            await FirebaseAuth.instance.signOut();
            if (credential.user != null) {
              FirebaseHelper().insertUser(
                UserModel(
                  name: _fullNameController.text,
                  uid: credential.user?.uid ?? '',
                  balance: 1000,
                ),
              );
              if (context.mounted) {
                Navigator.pop(context);
              }
            }
          } catch (e) {
            print(e);
          }
        }
      },
      style: FilledButton.styleFrom(
        backgroundColor: ThemeColor.secondary,
        minimumSize: const Size.fromHeight(56),
      ),
      child: const Text(
        "Create Account",
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    );
  }

  _haveAccount(BuildContext context) => TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        style: TextButton.styleFrom(
          surfaceTintColor: Colors.transparent,
        ),
        child: const Text(
          "Already Have Account?  Login.",
          style: TextStyle(
            color: Colors.white54,
            fontSize: 14,
          ),
        ),
      );
}
