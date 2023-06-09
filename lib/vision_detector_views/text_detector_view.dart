import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'camera_view.dart';
import 'painters/text_detector_painter.dart';
import 'package:alan_voice/alan_voice.dart';

final RouteObserver<PageRoute> routeObserver1 = RouteObserver<PageRoute>();

class TextRecognizerView extends StatefulWidget {
  @override
  State<TextRecognizerView> createState() => _TextRecognizerViewState();
}

class _TextRecognizerViewState extends State<TextRecognizerView> with RouteAware{
  final TextRecognizer _textRecognizer =
  TextRecognizer(script: TextRecognitionScript.chinese);
  bool _canProcess = true;
  bool _isBusy = false;
  CustomPaint? _customPaint;
  String? _text;
  FlutterTts flutterTts = FlutterTts();
  bool _isPlaying = false;


  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    routeObserver1.subscribe(this, ModalRoute.of(context) as PageRoute);
  }

  @override
  Future<void> dispose() async {
    _canProcess = false;
    _textRecognizer.close();
    await flutterTts.stop();
    routeObserver1.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPush(){
    //setVisuals("second");
    setVisuals("second face");

  }

  @override
  void didPop(){
    setVisuals("first");
  }

  void setVisuals(String screen){
    var visual = "{\"screen\" : \"$screen\"}";
    AlanVoice.setVisualState(visual);
  }



  // @override
  // void dispose() async {
  //   _canProcess = false;
  //   _textRecognizer.close();
  //   await flutterTts.stop();
  //   super.dispose();
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Stack(
  //     children: [
  //       CameraView(
  //         title: 'Text Detector',
  //         customPaint: _customPaint,
  //         text: _text,
  //         onImage: (inputImage) {
  //           processImage(inputImage);
  //
  //         },
  //       ),
  //       Positioned(
  //         bottom: 16.0,
  //         right: 16.0,
  //         child: Row(
  //           children: [
  //             FloatingActionButton(
  //               onPressed: () {
  //                 // Play button logic
  //
  //                 speak(_text ?? '');
  //               },
  //               child: Icon(Icons.play_arrow),
  //             ),
  //             SizedBox(width: 16.0),
  //             FloatingActionButton(
  //               onPressed: () {
  //                 // Pause button logic
  //                 flutterTts.pause();
  //               },
  //               child: Icon(Icons.pause),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CameraView(
          title: 'Text Detector',
          customPaint: _customPaint,
          text: _text,
          onImage: (inputImage) {
            processImage(inputImage);
          },
        ),
        Positioned(
          bottom: 16.0,
          right: 16.0,
          child: Row(
            children: [
              FloatingActionButton(
                onPressed: () {
                  // Play button logic
                  if (!_isPlaying && _text != null && _text!.isNotEmpty) {
                    speak(_text!);
                    _isPlaying = true;
                  }
                },
                child: Icon(Icons.play_arrow),
              ),
              SizedBox(width: 16.0),
              FloatingActionButton(
                onPressed: () {
                  // Pause button logic
                  flutterTts.pause();
                  _isPlaying = false;
                },
                child: Icon(Icons.pause),
              ),
            ],
          ),
        ),
      ],
    );
  }


  Future<void> processImage(InputImage inputImage) async {
    if (!_canProcess) return;
    if (_isBusy) return;
    _isBusy = true;
    setState(() {
      _text = '';
    });
    final recognizedText = await _textRecognizer.processImage(inputImage);
    if (inputImage.inputImageData?.size != null &&
        inputImage.inputImageData?.imageRotation != null) {
      final painter = TextRecognizerPainter(
          recognizedText,
          inputImage.inputImageData!.size,
          inputImage.inputImageData!.imageRotation);
      _customPaint = CustomPaint(painter: painter);
    } else {
      _text = 'Recognized text:\n\n${recognizedText.text}';
      _customPaint = null;
    }
    _isBusy = false;
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> speak(String text) async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(text);
  }
}

