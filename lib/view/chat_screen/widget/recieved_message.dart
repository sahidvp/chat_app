import 'package:chat_application/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ReceivedMessage extends StatelessWidget {
  final String message;
  final String time;

  const ReceivedMessage({
    Key? key,
    required this.message,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 12, right: 80, top: 8, bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Row(children: [
                  Text(
                    message,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 4),
                    child: Text(
                      time,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 8,
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
