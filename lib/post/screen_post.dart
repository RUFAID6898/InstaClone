import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ScreenPost extends StatefulWidget {
  const ScreenPost({super.key});

  @override
  State<ScreenPost> createState() => _ScreenPostState();
}

class _ScreenPostState extends State<ScreenPost> {
  File? saveimage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.cancel_outlined),
        title: const Text('New Post'),
        centerTitle: true,
        actions: const [
          Text(
            'Next',
            style:
                TextStyle(color: Color.fromARGB(255, 3, 66, 119), fontSize: 20),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
              color: Colors.grey,
              width: double.infinity,
              height: 350,
              child: SizedBox(
                child: saveimage != null
                    ? Image.file(saveimage!)
                    : const Center(child: Text('Selact image')),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  onPressed: () {
                    pickimage();
                  },
                  child: const Text('select photo')),
              IconButton(
                  onPressed: () {
                    pickCamera();
                  },
                  icon: const Icon(Icons.camera_alt_outlined)),
            ],
          ),
          const Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [],
            ),
          ))
        ],
      ),
    );
  }

  void pickimage() async {
    // XFile? _image;
    var images = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      saveimage = File(images!.path);
    });
  }

  void pickCamera() async {
    // XFile? _camera;
    var camera = await ImagePicker().pickImage(source: ImageSource.camera);

    setState(() {
      saveimage = File(camera!.path);
    });
  }
}
