import 'package:coffee/theme/colors.dart';
import 'package:coffee/widgets/text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../signup/signup_page.dart';

class LoginForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const LoginForm({super.key, required this.formKey});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      color: ThemeColor.primary,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              height: 200,
              image: NetworkImage(
                'https://static.vecteezy.com/system/resources/previews/021/049/268/non_2x/3d-realistic-coffee-cup-coffee-cup-cartoon-free-png.png',
              ),
            ),
            ..._formHeader(),
            _emailField,
            const SizedBox(height: 16),
            _passwordField,
            const SizedBox(height: 32),
            _getStartedButton(context),
            const SizedBox(height: 8),
            _createAccountButton(context),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  List<Widget> _formHeader() {
    return [
      TextWidget(
        text: 'Welcome To Coffee Shop',
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: ThemeColor.text,
              fontWeight: FontWeight.w700,
            ),
      ),
      const SizedBox(height: 8),
      TextWidget(
          text: 'Please enter your login credentials to continue',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: ThemeColor.lightWhite,
                fontWeight: FontWeight.w500,
              ),
      ),
      const SizedBox(height: 36),
    ];
  }

  get _emailField => TextFormField(
        style: const TextStyle(color: Colors.white),
        controller: _emailController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            print('enter email');
            return 'Please enter your email.';
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
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ),
        ),
      );

  get _passwordField => TextFormField(
        style: const TextStyle(color: Colors.white),
        controller: _passwordController,
        obscureText: true,
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
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your password.';
          }
          return null;
        },
      );

  _getStartedButton(BuildContext context) {
    return FilledButton(
      onPressed: () async {
        if (widget.formKey.currentState!.validate()) {
          try {
            final credential = await FirebaseAuth.instance
                .signInWithEmailAndPassword(
                    email: _emailController.text,
                    password: _passwordController.text);
            if (credential.user != null) {
            } else {
              print('Please Enter Valid Credential');
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
        "Let's get started",
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    );
  }

  _createAccountButton(BuildContext context) => TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SignupPage(),
            ),
          );
        },
        style: TextButton.styleFrom(
          surfaceTintColor: Colors.transparent,
        ),
        child: const Text(
          "Don't have Account? Create one.",
          style: TextStyle(
            color: Colors.white54,
            fontSize: 14,
          ),
        ),
      );
}
