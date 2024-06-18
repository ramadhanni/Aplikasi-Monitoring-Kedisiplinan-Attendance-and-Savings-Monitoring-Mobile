import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class PerubahanBiodata extends StatefulWidget {
  const PerubahanBiodata({super.key});
  @override
  _PerubahanBiodataState createState() => _PerubahanBiodataState();
}

class _PerubahanBiodataState extends State<PerubahanBiodata> {
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajukan Perubahan Biodata'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                input(_image, _pickImage)
              ],
            )
          ],
        )
      ),
    );
  }
}

Widget input(File? image, Future<void> Function() pickImage) {
  return 
      Center(
        child: Column(
          children: [
        const SizedBox(height: 20),
            Container(
              width: 370,
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
              margin: const EdgeInsets.only(top:40),
              decoration: const BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10)
                )
              ),
              child: const Text(
                'Ajukan Perubahan Biodaa',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17
                ),
              ),
            ),
            Container(
              width: 369,
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Colors.teal
                  ),
                  right: BorderSide(
                    width: 1,
                    color: Colors.teal
                  ),
                  left: BorderSide(
                    width: 1,
                    color: Colors.teal
                  )
                )
              ),
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: pickImage,
                    child: image == null
                        ? const CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.grey,
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 40,
                            ),
                          )
                        : CircleAvatar(
                            radius: 60,
                            backgroundImage: FileImage(image),
                          ),
                  ),
                  TextField(
                    maxLines: 7,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Keterangan....'
                    ),
                  ),
                ],
              ) 
            ),
            Container(
              width: 370,
              color: Colors.teal,
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
              child: const Text(
                'Kirim',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17
                ),
              ),
            )
          ],
        )

  );
}
