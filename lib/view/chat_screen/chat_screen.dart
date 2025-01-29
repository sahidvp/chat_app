import 'package:chat_application/utils/screen_util.dart';
import 'package:chat_application/utils/theme/app_colors.dart';
import 'package:chat_application/view/chat_screen/widget/chat_header.dart';
import 'package:chat_application/view/chat_screen/widget/chips.dart';
import 'package:chat_application/view/chat_screen/widget/message_date.dart';
import 'package:chat_application/view/chat_screen/widget/message_typing_field.dart';
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
          Chips(),
          messageDate(),

          const Expanded(
            child: Center(child: Text("Chat screen content")),
          ),
          MessageTypingField(),
        ],
      ),
    );
  }
}
