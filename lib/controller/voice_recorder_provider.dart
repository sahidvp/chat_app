import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'dart:async';

class VoiceRecorderProvider extends ChangeNotifier {
  final FlutterSoundRecorder _recorder = FlutterSoundRecorder();
  bool isRecording = false;
  bool hasRecordedAudio = false;
  String? recordedFilePath;
  Timer? _waveformTimer;
  double _waveProgress = 0.0;

  VoiceRecorderProvider() {
    _initRecorder();
  }

  Future<void> _initRecorder() async {
    await _recorder.openRecorder();
  }

  Future<void> startRecording() async {
    try {
      String filePath = 'audio_${DateTime.now().millisecondsSinceEpoch}.aac';
      await _recorder.startRecorder(toFile: filePath);
      recordedFilePath = filePath;
      isRecording = true;
      notifyListeners();

      // Start waveform animation
      _waveformTimer = Timer.periodic(Duration(milliseconds: 300), (timer) {
        _waveProgress = (_waveProgress + 0.1) % 1.0;
        notifyListeners();
      });
    } catch (e) {
      print('Error starting recording: $e');
    }
  }
double get waveProgress => _waveProgress;
  Future<void> stopRecording() async {
    await _recorder.stopRecorder();
    isRecording = false;
    hasRecordedAudio = true;
    _waveformTimer?.cancel();
    notifyListeners();
  }

  void deleteRecording() {
    hasRecordedAudio = false;
    recordedFilePath = null;
    notifyListeners();
  }

  @override
  void dispose() {
    _recorder.closeRecorder();
    _waveformTimer?.cancel();
    super.dispose();
  }
}
