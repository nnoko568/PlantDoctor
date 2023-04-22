import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../helpers/app_color.dart';

class UserImagePicker extends StatefulWidget {
  const UserImagePicker({super.key});

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  XFile? _selectedPickedImage;

  Future<void> _pickImageByCamera() async {
    ImagePicker picker = ImagePicker();
    final photo = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      _selectedPickedImage = photo;
    });
  }

  Future<void> _pickImageByGalery() async {
    ImagePicker picker = ImagePicker();
    final photo = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedPickedImage = photo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            height: 150.0,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: AppColor.formBorderColor,
                width: 1.0,
                style: BorderStyle.solid,
              ),
            ),
            child: _selectedPickedImage == null
                ? const Icon(
                    Icons.upload,
                    size: 60.0,
                    color: AppColor.lightGray,
                  )
                : Image.file(
                    fit: BoxFit.cover,
                    File(_selectedPickedImage!.path),
                  ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Take photo!'),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextButton(
                                onPressed: () {
                                  _pickImageByCamera();
                                  Navigator.of(context).pop();
                                },
                                child: Text('Camera'),
                              ),
                              TextButton(
                                onPressed: () {
                                  _pickImageByGalery();
                                  Navigator.of(context).pop();
                                },
                                child: Text('Gallery'),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: AppColor.mainColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 30.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        _selectedPickedImage = null;
                      });
                    },
                    child: Text(
                      'Delete photo',
                      style: TextStyle(
                        color: _selectedPickedImage != null
                            ? Colors.red
                            : AppColor.lightGray,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
