import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myqr/qr_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myqr/scanner.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  File? _image;
  final _picker = ImagePicker();
  // Implementing the image picker
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
      _image?.deleteSync();
      super.dispose();
    }
  }

  void dispose() {
    _image?.deleteSync();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 243, 244, 0.98),
      //extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(216, 191, 216, 1),
        //forceMaterialTransparency: true,
        centerTitle: true,
        title: Text(
          'Home',
          style: GoogleFonts.openSans(
              textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700)),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 70.0),
              Center(
                child: Container(
                  width: 350,
                  margin: const EdgeInsets.all(20),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Url';
                      }
                      return null; // Return null to indicate no validation error
                    },
                    controller: controller,
                    decoration: const InputDecoration(
                        hintText: 'Input url here',
                        hintStyle: TextStyle(color: Colors.grey),
                        focusColor: const Color.fromRGBO(216, 191, 216, 1),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: const Color.fromRGBO(216, 191, 216, 1))),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    const Color.fromRGBO(216, 191, 216, 1)))),
                  ),
                ),
              ),
              const SizedBox(height: 50.0),
              Container(
                width: 350,
                height: 200,
                color: Colors.grey[300],
                child: _image != null
                    ? Image.file(_image!, fit: BoxFit.cover)
                    : Column(
                        children: [
                          const SizedBox(height: 50.0),
                          Padding(
                            padding: const EdgeInsets.only(right:35.0),
                            child: IconButton(
                              splashRadius: 1,
                              icon: Icon(
                                Icons.photo,
                                size: 70,
                              ),
                              onPressed: () {
                                _openImagePicker();
                              },
                            ),
                          ),
                          const SizedBox(height: 30.0),
                          Center(
                            child: const Text(
                              'Tap to select an image',
                              style: TextStyle(
                                  color: const Color.fromRGBO(216, 191, 216, 1),
                                  fontWeight: FontWeight.w700),
                            ),
                          )
                        ],
                      ),
              ),
              const SizedBox(
                height: 30,
              ),
              //This button when pressed navigates to QR code generation
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          const Color.fromRGBO(216, 191, 216, 1))),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      print("Validated");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) {
                            return QRImageView(controller, _image);
                          }),
                        ),
                      );
                    } else {
                      print(" not Validated");
                    }
                  },
                  child: const Text('GENERATE QR CODE')),

              const SizedBox(
                height: 150,
              ),
              Center(
                child: CircleAvatar(
                    backgroundColor: const Color.fromRGBO(216, 191, 216, 1),
                    radius: 40.0,
                    child: Padding(
                        padding: EdgeInsets.only(right: 18.0, bottom: 18.0),
                        child: IconButton(
                            splashRadius: 1,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => QRScanner()));
                            },
                            icon: Icon(
                              Icons.qr_code_scanner,
                              size: 50.0,
                              color: Colors.black,
                            )))),
              ),
              const SizedBox(
                height: 30.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
