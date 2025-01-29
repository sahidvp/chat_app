 import 'package:chat_application/utils/screen_util.dart';
import 'package:chat_application/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

Padding messageDate() {
    return Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 8.0), // Space above and below
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.greyLight, // Light background for the date
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                "August 14",
                style: TextStyle(
                  fontSize: ScreenUtil.smallText,
                  color: AppColors.black,
                ),
              ),
            ),
          ),
        );
  }