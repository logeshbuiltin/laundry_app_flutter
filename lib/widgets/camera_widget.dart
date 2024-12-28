import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:laundry_app_ui/pages/imageview_screen.dart';
import 'package:laundry_app_ui/utils/constants.dart';

class CameraWidget extends StatefulWidget{
  final List<CameraDescription> cameras;
  const CameraWidget({super.key, required this.cameras});

  @override
  State<CameraWidget> createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget>{
  late CameraController controller;
  late XFile? imageFile; // Variable to store the captured image file

  @override
  void initState() {
    super.initState();
    controller = CameraController(widget.cameras[1], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: BackButton(
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: Text(
            'Take a picture',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Stack(
          children: <Widget>[
            CameraPreview(controller),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: FloatingActionButton(
                  onPressed: () {
                    _takePicture(); // Call method to take picture
                  },
                  child: Icon(Icons.camera),
                  backgroundColor: Colors.white,
                  foregroundColor: Constants.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to take a picture
  void _takePicture() async {
    try {
      final XFile picture = await controller.takePicture();
      setState(() {
        imageFile = picture;
      });
      // Navigate to the image view page after capturing the image
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ImageviewScreen(imagePath: imageFile!.path),
        ),
      );
    } catch (e) {
      print("Error taking picture: $e");
    }
  }
}
