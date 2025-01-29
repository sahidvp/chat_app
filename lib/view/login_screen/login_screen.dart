import 'package:chat_application/controller/auth_controller.dart';
import 'package:chat_application/utils/screen_util.dart';
import 'package:chat_application/view/home_screen.dart/home_screen.dart';
import 'package:chat_application/view/login_screen/widgets/login_button.dart';
import 'package:chat_application/view/login_screen/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  void _handleLogin(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final username = emailController.text;
      final password = passwordController.text;

      final authController = context.read<AuthController>();
      final success = await authController.login(username, password);

      if (success) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => HomeScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Incorrect username and password.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil.defaultPadding,
                vertical: ScreenUtil.safeAreaTop + 20,
              ),
              child: Form(
                key: _formKey,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: ScreenUtil.getResponsiveValue(
                      mobile: ScreenUtil.screenWidth,
                     
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: ScreenUtil.height(0.04)),
                      Text(
                        'Welcome Back',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: ScreenUtil.extraLargeText,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Enter your credentials for login",
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: ScreenUtil.height(0.03)),
                      ResponsiveTextField(
                        controller: emailController,
                        label: 'Username',
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: ScreenUtil.height(0.02)),
                      ResponsiveTextField(
                        controller: passwordController,
                        label: 'Password',
                        isPassword: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: ScreenUtil.height(0.03)),
                      LoginButton(onPressed: () => _handleLogin(context)),
                      SizedBox(height: ScreenUtil.height(0.02)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
