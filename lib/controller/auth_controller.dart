// // lib/controllers/auth_controller.dart
// import 'package:flutter/material.dart';

// import 'package:shared_preferences/shared_preferences.dart';

// class AuthController extends ChangeNotifier {
//   static const String STORAGE_KEY = 'user_credentials';
//   bool _isLoggedIn = false;
  
//   bool get isLoggedIn => _isLoggedIn;
  
//   // Check if user is already logged in
//   Future<bool> checkLoginStatus() async {
//     final prefs = await SharedPreferences.getInstance();
//     _isLoggedIn = prefs.getString(STORAGE_KEY) != null;
//     notifyListeners();
//     return _isLoggedIn;
//   }

//   // Login and save credentials
//   Future<bool> login(String username, String password) async {
//     try {
//       // Here you would typically validate credentials with your backend
//       // For this example, we'll just save them
//       final prefs = await SharedPreferences.getInstance();
      
//       // Save credentials as JSON string
//       await prefs.setString(STORAGE_KEY, username);
      
//       _isLoggedIn = true;
//       notifyListeners();
//       return true;
//     } catch (e) {
//       return false;
//     }
//   }

//   // Logout
//   Future<void> logout() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove(STORAGE_KEY);
//     _isLoggedIn = false;
//     notifyListeners();
//   }
// }


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends ChangeNotifier {
  static const String STORAGE_KEY = 'is_logged_in';
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  // Check if user is already logged in
  Future<bool> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    _isLoggedIn = prefs.getBool(STORAGE_KEY) ?? false;
    notifyListeners();
    return _isLoggedIn;
  }

  // Login with fixed username and password
  Future<bool> login(String username, String password) async {
    if (username == "Texol" && password == "texol123") {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(STORAGE_KEY, true); // Store login state

      _isLoggedIn = true;
      notifyListeners();
      return true;
    }
    return false;
  }

  // Logout
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(STORAGE_KEY);
    _isLoggedIn = false;
    notifyListeners();
  }
}
