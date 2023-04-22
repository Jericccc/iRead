


import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import '../firebase_options.dart';
import '../home_page.dart';
import '../onboardingpage.dart';
import 'package:get/get.dart';
import '../authentication_repository.dart';
import '../nlp_detector_views/entity_extraction_view.dart';
import '../nlp_detector_views/language_identifier_view.dart';
import '../nlp_detector_views/language_translator_view.dart';
import '../nlp_detector_views/smart_reply_view.dart';
import '../vision_detector_views/barcode_scanner_view.dart';
import '../vision_detector_views/digital_ink_recognizer_view.dart';
import '../vision_detector_views/face_detector_view.dart';
import '../vision_detector_views/label_detector_view.dart';
import '../vision_detector_views/object_detector_view.dart';
import '../vision_detector_views/pose_detector_view.dart';
import '../vision_detector_views/selfie_segmenter_view.dart';
import '../vision_detector_views/text_detector_view.dart';

import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:alan_voice/alan_voice.dart';

// import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

List<CameraDescription> cameras = [];

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomePage1(),
//       navigatorObservers: [ ],
//       initialRoute: '/',
//       routes: {
//         '/faceDetector': (context) => FaceDetectorView(),
//       },
//     );
//   }
// }



class HomePage1 extends StatefulWidget {
  const HomePage1({Key? key}) : super(key: key);

  @override
  State<HomePage1> createState() => _HomePageState1();
}

class _HomePageState1 extends State<HomePage1> with RouteAware{


  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => setVisuals("first"));
  }

  void setVisuals(String screen){
    var visual = "{\"screen\" : \"$screen\"}";
    AlanVoice.setVisualState(visual);
  }


  _HomePageState1() {
    /// Init Alan Button with project key from Alan Studio
    AlanVoice.addButton("68bdf8c111b50f3760f31b57023418e02e956eca572e1d8b807a3e2338fdd0dc/stage",
        buttonAlign: AlanVoice.BUTTON_ALIGN_LEFT);

    /// Handle commands from Alan Studio
    AlanVoice.onCommand.add((command) => _handleCommand(command.data));
  }

  void _handleCommand(Map<String, dynamic> command){
    switch(command["command"]){
      case "forward":
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => FaceDetectorView()));
        break;

      case "navigate to object detector":
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ObjectDetectorView()));
        break;

      case "navigate to image label":
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ImageLabelView()));
        break;

      case "navigate to text recognizer":
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => TextRecognizerView()));
        break;

    // case "navigate to image classification":
    //   Navigator.push(
    //       context, MaterialPageRoute(builder: (context) => ImageClassification()));
    //   break;



      case "back":
        Navigator.pop(context);
        break;

      default:
        debugPrint("Unknown command");
    }
  }


  // @override
  // Widget build(BuildContext context) {
  //   return const Placeholder();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('iRead'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  // CustomCard('Text Recognition', TextRecognizerView()),
                  // CustomCard('ImageClassification', ImageClassification()),
                  CustomCard('Face Detection', FaceDetectorView()),
                  CustomCard('Image Labeling', ImageLabelView()),
                  CustomCard('Object Detection', ObjectDetectorView()),
                  CustomCard('Text Recognition', TextRecognizerView()),
                  // ExpansionTile(
                  //   title: const Text('Vision APIs'),
                  //
                  //   children: [
                  //     // CustomCard('Barcode Scanning', BarcodeScannerView()),
                  //     // CustomCard('Face Detection', FaceDetectorView()),
                  //     // CustomCard('Image Labeling', ImageLabelView()),
                  //     // CustomCard('Object Detection', ObjectDetectorView()),
                  //     // CustomCard('Text Recognition', TextRecognizerView()),
                  //    // CustomCard('Digital Ink Recognition', DigitalInkView()),
                  //   //  CustomCard('Pose Detection', PoseDetectorView()),
                  //    // CustomCard('Selfie Segmentation', SelfieSegmenterView()),
                  //   ],
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  // ExpansionTile(
                  //   title: const Text('Natural Language APIs'),
                  //   children: [
                  //     CustomCard('Language ID', LanguageIdentifierView()),
                  //     CustomCard(
                  //         'On-device Translation', LanguageTranslatorView()),
                  //     CustomCard('Smart Reply', SmartReplyView()),
                  //     CustomCard('Entity Extraction', EntityExtractionView()),
                  //   ],
                  //  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class CustomCard extends StatelessWidget {
  final String _label;
  final Widget _viewPage;
  final bool featureCompleted;

  const CustomCard(this._label, this._viewPage, {this.featureCompleted = true});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        tileColor: Theme
            .of(context)
            .primaryColor,
        title: Text(
          _label,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        onTap: () {
          if (!featureCompleted) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content:
                const Text('This feature has not been implemented yet')));
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => _viewPage));
          }
        },
      ),
    );
  }
}