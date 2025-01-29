import 'package:chat_application/controller/auth_controller.dart';
import 'package:chat_application/controller/login_provider.dart';
import 'package:chat_application/controller/voice_recorder_provider.dart';
import 'package:chat_application/utils/theme/app_colors.dart';
import 'package:chat_application/view/home_screen.dart/home_screen.dart';
import 'package:chat_application/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => AuthController()),
        ChangeNotifierProvider(create: (_) => VoiceRecorderProvider())
        // Add other providers here
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "SFProDisplay",
        scaffoldBackgroundColor: AppColors.background,
      ),
      home: FutureBuilder(
        // Check login status when app starts
        future: context.read<AuthController>().checkLoginStatus(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // Listen to auth state changes
          return Consumer<AuthController>(
            builder: (context, auth, _) {
              // Redirect based on login status
              return auth.isLoggedIn ? HomeScreen() : LoginScreen();
            },
          );
        },
      ),
    );
  }
}
