import 'package:chat_application/utils/screen_util.dart';
import 'package:chat_application/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ChatHeader extends StatelessWidget {
  const ChatHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.greyLight, // Set the color of the bottom border
            width: 1.0, // Set the width of the bottom border
          ),
        ),
      ),
      // Padding for left and right
      height: ScreenUtil.height(0.07), // Height based on screen size (adjusted)
      color: Theme.of(context)
          .appBarTheme
          .backgroundColor, // Match the AppBar background color
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, // Space out the elements
        children: [
          Row(
            children: [
              // Back button with responsive size using ScreenUtil
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.of(context).pop(); // Go back to the previous screen
                },
                iconSize: ScreenUtil.getResponsiveValue(
                  mobile: 20, // Size for mobile
                ),
              ),

              CircleAvatar(
                radius: ScreenUtil.getResponsiveValue(
                  mobile: 18, // Radius for mobile
                ),
                backgroundImage: AssetImage(
                    'assets/images/user2.png'), // Replace with your image path
              ),
              const SizedBox(width: 5), // Space between image and username
              // Username
              Text(
                'Michael knight',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: ScreenUtil.mediumText), // Responsive font size
              ),
            ],
          ),
          // Search icon on the right side
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Add functionality for search here
            },
            iconSize: ScreenUtil.getResponsiveValue(
              mobile: 24, // Search icon size for mobile
              // Search icon size for desktop
            ),
          ),
        ],
      ),
    );
  }
}
