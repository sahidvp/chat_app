

import 'package:chat_application/controller/voice_recorder_provider.dart';
import 'package:chat_application/utils/screen_util.dart';
import 'package:chat_application/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:permission_handler/permission_handler.dart';

class MessageTypingField extends StatelessWidget {
  const MessageTypingField({super.key});

  // Function to request microphone permission
  Future<bool> requestMicrophonePermission() async {
    var status = await Permission.microphone.request();
    return status == PermissionStatus.granted;
  }

  // Function to start or stop recording
  void handleRecording(
      BuildContext context, VoiceRecorderProvider recorderProvider) async {
    bool hasPermission = await requestMicrophonePermission();

    if (!hasPermission) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Microphone permission denied!")),
      );
      return;
    }

    if (recorderProvider.isRecording) {
      recorderProvider.stopRecording();
    } else {
      recorderProvider.startRecording();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(ScreenUtil.defaultPadding),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Consumer<VoiceRecorderProvider>(
            builder: (context, recorderProvider, child) {
              return Row(
                children: [
                  // Show input field if no recorded audio
                  if (!recorderProvider.hasRecordedAudio)
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.attach_file_rounded,
                            color: AppColors.buttonPrimary,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
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

                  if (recorderProvider.isRecording) // Show animated waveform
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            height: 50,
                            alignment: Alignment.center,
                            child: LinearProgressIndicator(
                              value: recorderProvider.waveProgress,
                              backgroundColor: AppColors.grey,
                              color: AppColors.buttonPrimary,
                            ),
                          ),
                          Center(
                            child: Text(
                              "Recording...",
                              style: TextStyle(color: AppColors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),

                  if (recorderProvider
                      .hasRecordedAudio) // Show delete/send buttons
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: recorderProvider.deleteRecording,
                        ),
                        IconButton(
                          icon:
                              Icon(Icons.send, color: AppColors.buttonPrimary),
                          onPressed: () {
                            // Handle sending recorded message
                          },
                        ),
                      ],
                    ),

                  SizedBox(width: 8),

                  // Mic Button for Recording
                  Material(
                    color: recorderProvider.isRecording
                        ? Colors.red
                        : AppColors.buttonPrimary,
                    borderRadius: BorderRadius.circular(15),
                    child: InkWell(
                      onTap: () => handleRecording(context, recorderProvider),
                      borderRadius: BorderRadius.circular(30),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          recorderProvider.isRecording ? Icons.stop : Icons.mic,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
