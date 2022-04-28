import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class UserImagePicker extends StatefulWidget {
  const UserImagePicker({Key? key}) : super(key: key);

  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  XFile? _pickedImage;

  void_PickImage() async {
    final ImagePicker _picker = ImagePicker();

    final pickedImageFile = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _pickedImage = pickedImageFile;
    });
  }

  void_PickGallery() async {
    final ImagePicker _picker = ImagePicker();

    final pickedImageFile =
    await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _pickedImage = pickedImageFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(
        height: 70,
      ),
      SizedBox(
        height: 115,
        width: 115,
        child: Stack(
          clipBehavior: Clip.none,
          fit: StackFit.expand,
          children:  [
            CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage:
              _pickedImage != null ? FileImage(File(_pickedImage!.path)) : null,
            ),
            Positioned(
              bottom: 15,
              right: -5,
              child:GestureDetector(
                onTap: (){ _showBottomSheet();},
                child: const CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.edit,color: Colors.grey,),
                ),
              ), ),

          ],

        ),
      )
    ]
    );
  }

  _showBottomSheet() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('gallery'),
                  onTap: () {
                    void_PickGallery();
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.camera),
                  title: const Text('camera'),
                  onTap: () {
                    void_PickImage();
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          );
        });
  }
}