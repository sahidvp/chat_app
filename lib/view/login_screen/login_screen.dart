// import 'package:flutter/material.dart';

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//       child: Container(

//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "Welcome Back",
//               style: TextStyle(
//                   fontSize: 35,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black),
//             ),
//             Text(
//               "Enter your credential for login",
//               style: TextStyle(color: Colors.black),
//             ),
//             TextFormField(),

//           ],
//         ),
//       ),
//     ));
//   }
// }

// lib/screens/login_screen.dart
import 'package:chat_application/utils/screen_util.dart';
import 'package:chat_application/view/login_screen/widgets/text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

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
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: ScreenUtil.getResponsiveValue(
                    mobile: ScreenUtil.screenWidth,
                    tablet: 600,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: ScreenUtil.height(0.04)),

                    // Welcome Text
                    Text(
                      'Welcome Back',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: ScreenUtil.extraLargeText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Enter your credential for login",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: ScreenUtil.height(0.03)),

                    // Email Input
                    ResponsiveTextField(
                      controller: emailController,
                      label: 'Username',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: ScreenUtil.height(0.02)),

                    // Password Input
                    ResponsiveTextField(
                      controller: passwordController,
                      label: 'Password',
                      isPassword: true,
                    ),
                    SizedBox(height: ScreenUtil.height(0.03)),

                    // Login Button
                    SizedBox(
                      height: ScreenUtil.buttonHeight,
                      child: ElevatedButton(
                        onPressed: () {
                          // Login logic
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: ScreenUtil.mediumText,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: ScreenUtil.height(0.02)),

                    // Additional Options
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
