import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:zefyr/zefyr.dart';

class MyAppZefyrImageDelegate implements ZefyrImageDelegate<ImageSource> {
  final picker = ImagePicker();

  @override
  Future<String> pickImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);
    if (pickedFile == null) return null;
    // We simply return the absolute path to selected file.
    final File file = File(pickedFile.path);
    return file.uri.toString();
  }

  @override
  Widget buildImage(BuildContext context, String key) {
    // debugPrint(key);
    final file = File.fromUri(Uri.parse(key));

    /// Create standard [FileImage] provider. If [key] was an HTTP link
    /// we could use [NetworkImage] instead.
    final image = FileImage(file);
    return Image(image: image);
  }

  @override
  ImageSource get cameraSource => ImageSource.camera;

  @override
  ImageSource get gallerySource => ImageSource.gallery;
}
