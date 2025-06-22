import 'package:flutter/material.dart';
import 'package:flutter_atividade/main.dart';
import 'package:flutter_atividade/models/user.dart';
import 'package:flutter_atividade/ui/widgets/appbar.dart';

import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        leftButton: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Text(""),
        ),
        centerText: Text("Tirar uma foto"),
        rightButton: IconButton(icon: Text(""), onPressed: () {}),
        bottomButtons: [],
      ),
      // You must wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner until the
      // controller has finished initializing.
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return CameraPreview(_controller);
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        // Provide an onPressed callback.
        onPressed: () async {
          // Take the Picture in a try / catch block. If anything goes wrong,
          // catch the error.
          try {
            // Ensure that the camera is initialized.
            await _initializeControllerFuture;

            // Attempt to take a picture and get the file `image`
            // where it was saved.
            final image = await _controller.takePicture();
            theUser.profilePicture = image.path;

            if (!context.mounted) return;

            // If the picture was taken, display it on a new screen.
            Navigator.pop(context);
          } catch (e) {
            // If an error occurs, log the error to the console.
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
