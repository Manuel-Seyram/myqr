import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

// ignore: must_be_immutable
class QRImageView extends StatelessWidget {
  QRImageView(this.controller, this._image, {Key? key}) : super(key: key);

  final TextEditingController controller;
  final File? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 243, 244, 1),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            splashRadius: 1,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close,
              color: Colors.black,
              size: 30,
            ),
          )
        ],
      ),
      body: Center(
        child: QrImageView(
          version: 3,
          data: controller.text,
          size: 280,
          dataModuleStyle: QrDataModuleStyle(
            dataModuleShape: QrDataModuleShape.square,
            color: Colors.black,
          ),
          eyeStyle: QrEyeStyle(
            eyeShape: QrEyeShape.circle,
            color: Color.fromARGB(255, 190, 174, 179),
          ),
          embeddedImage: _image != null ? FileImage(_image!) : null,
          embeddedImageStyle: QrEmbeddedImageStyle(
            size: const Size(
              50,
              50,
            ),
          ),
        ),
      ),
    );
  }
}
