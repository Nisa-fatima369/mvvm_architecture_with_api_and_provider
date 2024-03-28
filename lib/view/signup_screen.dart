import 'package:flutter/material.dart';
import 'package:mvvm_architecture_with_api_and_provider/resource/colors.dart';
import 'package:mvvm_architecture_with_api_and_provider/resource/components/round_button.dart';
import 'package:mvvm_architecture_with_api_and_provider/utils/routes/routes.dart';
import 'package:mvvm_architecture_with_api_and_provider/utils/utils/utils.dart';
import 'package:mvvm_architecture_with_api_and_provider/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  
  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    _obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'SignUp Screen',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.primary,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              focusNode: emailFocusNode,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Enter your email',
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
              ),
              onFieldSubmitted: (value) {
                Utils.focusChange(context, emailFocusNode, passwordFocusNode);
              },
            ),
            const SizedBox(height: 20),
            ValueListenableBuilder(
                valueListenable: _obsecurePassword,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: passwordController,
                    focusNode: passwordFocusNode,
                    obscureText: _obsecurePassword.value,
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: InkWell(
                        onTap: () {
                          _obsecurePassword.value = !_obsecurePassword.value;
                        },
                        child: Icon(_obsecurePassword.value
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                    ),
                  );
                }),
            const SizedBox(height: 40),
            RoundButton(
              title: 'SignUp',
              isLoading: authViewModel.isLoading,
              onPressed: () {
                if (emailController.text.isEmpty ||
                    passwordController.text.isEmpty) {
                  Utils.flushBarErrorMessage(
                      'Please fill above fields', context);
                } else if (passwordController.text.length < 6) {
                  Utils.flushBarErrorMessage(
                      'Password must be at least 6 characters', context);
                } else {
                  Map<String, dynamic> data = {
                    'email': emailController.text.toString(),
                    'password': passwordController.text.toString()
                  };
                  authViewModel.login(data, context);
                }
              },
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, Routes.login);
              },
              child: const Text(
                'Already have an account? Login',
              ),
            ),
          ],
        ),
      ),
    );
  }
}