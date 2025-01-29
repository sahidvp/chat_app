import 'package:chat_application/controller/login_provider.dart';
import 'package:chat_application/utils/screen_util.dart';
import 'package:chat_application/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResponsiveTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool isPassword;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const ResponsiveTextField({
    super.key,
    required this.controller,
    required this.label,
    this.isPassword = false,
    this.keyboardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (context, formProvider, _) {
        return SizedBox(
          height: ScreenUtil.inputFieldHeight,
          child: TextFormField(
            controller: controller,
            obscureText: isPassword && !formProvider.isPasswordVisible,
            keyboardType: keyboardType,
            validator: validator,
            style: TextStyle(fontSize: ScreenUtil.mediumText),
            decoration: InputDecoration(
              labelText: label,
              labelStyle: TextStyle(fontSize: ScreenUtil.smallText),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.buttonColor),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              suffixIcon: isPassword
                  ? IconButton(
                      icon: Icon(
                        formProvider.isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        formProvider.togglePasswordVisibility();
                      },
                    )
                  : null,
            ),
          ),
        );
      },
    );
  }
}