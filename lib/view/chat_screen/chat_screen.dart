import 'package:chat_application/utils/screen_util.dart';
import 'package:chat_application/utils/theme/app_colors.dart';
import 'package:chat_application/view/chat_screen/widget/buil_chip.dart';
import 'package:chat_application/view/chat_screen/widget/chat_header.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil with the context
    ScreenUtil.init(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          SizedBox(height: 20),
          ChatHeader(),
          // Wrapping Container with Material widget to apply elevation
          Material(
            elevation: 4, // Adjust the elevation to control the shadow size
            shadowColor: Colors.black.withOpacity(0.1), // Set shadow color
            borderRadius:
                BorderRadius.circular(8), // Optional: to round corners
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.background,
                border: Border(
                  bottom: BorderSide(
                    color: AppColors
                        .greyLight, // Set the color of the bottom border
                    width: 1.0, // Set the width of the bottom border
                  ),
                ),
                borderRadius:
                    BorderRadius.circular(8), // Optional: to round corners
              ),
              child: Padding(
                padding: EdgeInsets.only(left: ScreenUtil.defaultPadding),
                child: SingleChildScrollView(
                  scrollDirection:
                      Axis.horizontal, // Enable horizontal scrolling
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      buildChip('All', AppColors.black, AppColors.background),
                      buildChip('Unread', AppColors.greyLight, AppColors.black),
                      buildChip(
                          'Approved',
                          const Color.fromARGB(255, 177, 226, 180),
                          AppColors.secondaryDark),
                      buildChip(
                          'Declined',
                          const Color.fromARGB(255, 222, 165, 164),
                          AppColors.error),
                      buildChip(
                          'Pending',
                          const Color.fromARGB(255, 235, 218, 166),
                          AppColors.warning),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Chat screen content
          const Expanded(
            child: Center(child: Text("Chat screen content")),
          ),
          Padding(
            padding: EdgeInsets.all(ScreenUtil.defaultPadding),
            child: Material(
              elevation: 2, // Subtle shadow for the input field
              borderRadius: BorderRadius.circular(20),
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20)),
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    hintText: "Type here",
                    hintStyle: TextStyle(color: AppColors.grey),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(
                          20), // Set the border radius here
                    ),
                    filled: true,
                    fillColor: AppColors.background,
                    suffixIcon: IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () {
                        // Handle send button action
                      },
                    ),
                  ),
                  textInputAction: TextInputAction.send,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
