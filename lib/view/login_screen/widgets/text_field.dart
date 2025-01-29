// import 'package:chat_application/utils/screen_util.dart';
// import 'package:flutter/material.dart';

// class ResponsiveTextField extends StatelessWidget {
//   final TextEditingController controller;
//   final String label;
//   final bool isPassword;
//   final TextInputType? keyboardType;

//   const ResponsiveTextField({
//     Key? key,
//     required this.controller,
//     required this.label,
//     this.isPassword = false,
//     this.keyboardType,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: ScreenUtil.inputFieldHeight,
//       child: TextFormField(
//         controller: controller,
//         obscureText: isPassword,
//         keyboardType: keyboardType,
//         style: TextStyle(fontSize: ScreenUtil.mediumText),
//         decoration: InputDecoration(
//           labelText: label,
//           labelStyle: TextStyle(fontSize: ScreenUtil.smallText),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//           ),
//           contentPadding: EdgeInsets.symmetric(
//             horizontal: 16,
//             vertical: 12,
//           ),
//         ),
//       ),
//     );
//   }
// }


// lib/widgets/responsive_text_field.dart
import 'package:chat_application/controller/login_provider.dart';
import 'package:chat_application/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ResponsiveTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool isPassword;
  final TextInputType? keyboardType;

  const ResponsiveTextField({
    Key? key,
    required this.controller,
    required this.label,
    this.isPassword = false,
    this.keyboardType,
  }) : super(key: key);

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
            style: TextStyle(fontSize: ScreenUtil.mediumText),
            decoration: InputDecoration(
              labelText: label,
              labelStyle: TextStyle(fontSize: ScreenUtil.smallText),
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