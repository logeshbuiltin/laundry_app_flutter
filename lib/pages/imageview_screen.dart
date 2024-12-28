import 'dart:io';

import 'package:flutter/material.dart';

class ImageviewScreen extends StatefulWidget{
  final String imagePath;
  const ImageviewScreen({super.key, required this.imagePath});

  @override
  State<ImageviewScreen> createState() => _ImageViewScreenState();
}

class _ImageViewScreenState extends State<ImageviewScreen>{
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Captured Image'),
      ),
      body: Center(
        child: Image.file(File(widget.imagePath)),
      ),
    );
  }
}