

import 'package:chat_application/utils/screen_util.dart';
import 'package:chat_application/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class MessageTypingField extends StatelessWidget {
  const MessageTypingField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(ScreenUtil.defaultPadding),
      child: Material(
        elevation: 2, // Subtle shadow for the input field
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.attach_file_rounded,
                      color: AppColors.buttonPrimary,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    hintText: "Type here",
                    hintStyle: TextStyle(color: AppColors.grey),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: true,
                    fillColor: AppColors.background,
                  ),
                  textInputAction: TextInputAction.send,
                ),
              ),

              SizedBox(width: 8), // Add space between text field and mic icon

              Material(
                color: AppColors.buttonPrimary,
                borderRadius: BorderRadius.circular(15), // Rounded button
                child: InkWell(
                  onTap: () {
                    // Handle mic button action
                  },
                  borderRadius: BorderRadius.circular(30),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.mic, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
