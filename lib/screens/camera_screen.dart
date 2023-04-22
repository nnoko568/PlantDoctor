import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../helpers/app_color.dart';
import '../screens/diagnose_screen.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  XFile? _selectedPickedImage;

  @override
  Widget build(BuildContext context) {
    Future<void> _pickImage() async {
      ImagePicker picker = ImagePicker();
      final photo = await picker.pickImage(source: ImageSource.camera);
      setState(() {
        _selectedPickedImage = photo;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Camera',
          style: TextStyle(color: AppColor.mainColor),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            ElevatedButton.icon(
              onPressed: () => _pickImage(),
              icon: Icon(
                Icons.camera,
                size: 45.0,
              ),
              label: Text(
                'Scan Image',
                style: TextStyle(fontSize: 20.0),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.mainColor,
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 15.0,
                ),
              ),
            ),
            _selectedPickedImage != null
                ? SizedBox(
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.55,
                          margin: const EdgeInsets.symmetric(vertical: 15.0),
                          child: Image.file(
                            fit: BoxFit.cover,
                            File(_selectedPickedImage!.path),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return const DiagnoseScreen();
                                },
                              ),
                            );
                          },
                          child: const Text(
                            'Proceed to Diagnosis',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.mainColor,
                            padding: const EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 15.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
