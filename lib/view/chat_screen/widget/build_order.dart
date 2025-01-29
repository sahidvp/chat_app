import 'package:chat_application/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class OrderMessage extends StatefulWidget {
  final String orderNumber;
  final String approvedBy;
  final String approvalTime;
  final String date;
  final String version;

  const OrderMessage({
    Key? key,
    required this.orderNumber,
    required this.approvedBy,
    required this.approvalTime,
    required this.date,
    required this.version,
  }) : super(key: key);

  @override
  State<OrderMessage> createState() => _OrderMessageState();
}

class _OrderMessageState extends State<OrderMessage> {
  bool isPlaying = false;
  double audioProgress = 0.2;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Audio player controls
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.greyLight.withOpacity(0.5),
                  ),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        isPlaying = !isPlaying;
                      });
                    },
                    icon: Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow,
                      color: Colors.black,
                      size: 24,
                    ),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: SliderTheme(
                    data: SliderThemeData(
                      trackHeight: 2,
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 4),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 8),
                      activeTrackColor: Colors.blue,
                      inactiveTrackColor: Colors.grey[200],
                      thumbColor: Colors.blue,
                    ),
                    child: Slider(
                      value: audioProgress,
                      onChanged: (value) {
                        setState(() {
                          audioProgress = value;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  "01:23",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),

          // Transcript section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Transcript',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
                Icon(Icons.keyboard_arrow_down, color: Colors.black, size: 16),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Order list',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
                Icon(Icons.keyboard_arrow_down, color: Colors.black, size: 16),
              ],
            ),
          ),

          // Order List section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.description_outlined, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      'Order No: ${widget.orderNumber}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Icon(Icons.keyboard_arrow_down, color: Colors.black, size: 16),
              ],
            ),
          ),

          // Approval status with version and time
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    'Approved by ${widget.approvedBy} on ${widget.approvalTime}',
                    style: TextStyle(
                      color: Colors.green[700],
                      fontSize: 11,
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                  child: Text(
                    widget.version,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  widget.date,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 10,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.done_all,
                  size: 13,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
