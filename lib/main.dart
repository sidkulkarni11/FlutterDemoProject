import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tic Tac To',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ImagePickerDemoPage(),
    );
  }
}

class ImagePickerDemoPage extends StatefulWidget {
  const ImagePickerDemoPage({super.key});

  @override
  State<ImagePickerDemoPage> createState() => _ImagePickerDemoPageState();
}

class _ImagePickerDemoPageState extends State<ImagePickerDemoPage> {
  File? imageFile;

  commonImagePicker(ImageSource imagesource) async {
    final ImagePicker picker = ImagePicker();
    // Pick an image.
    final XFile? image = await picker.pickImage(source: imagesource);
    // await picker.pickImage(source: ImageSource.gallery);
    // Capture a photo.
    //             final XFile? photo = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      imageFile = File(image.path);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              color: Colors.red,
              child:
                  imageFile != null ? Image.file(imageFile!) : const Offstage(),
            ),
            ElevatedButton(
                onPressed: () async {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              onTap: () async {
                                commonImagePicker(ImageSource.camera);
                                Navigator.pop(context);
                              },
                              leading: Icon(Icons.camera),
                              title: const Text("Camera"),
                            ),
                            ListTile(
                              onTap: () async {
                                commonImagePicker(ImageSource.gallery);
                                Navigator.pop(context);

                              },
                              leading: Icon(Icons.camera),
                              title: const Text("Gallery"),
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Text("Pick image"))
          ],
        ),
      ),
    );
  }
}
