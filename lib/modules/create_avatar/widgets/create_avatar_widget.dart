import 'dart:io';

import 'package:dope_moji/styles/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class CreateAvatar extends StatefulWidget {
  const CreateAvatar({Key? key}) : super(key: key);

  @override
  State<CreateAvatar> createState() => _CreateAvatarState();
}

class _CreateAvatarState extends State<CreateAvatar> {

  File? pickedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Avatar", style: AppText.appbarTagText,),
      ),
      body: Center(
        child: Column(
          children: [
            pickedImage!=null ? Image.file(pickedImage!, width: 150, height: 150, fit: BoxFit.cover,) : Image.asset("assets/images/purple_pattern.png", width: 150, height: 150, fit: BoxFit.cover,),
            ElevatedButton(child: const Text("Choose"), onPressed: () => initiateImagePicker(),),
            ElevatedButton(child: const Text("Upload"), onPressed: () => uploadImage(pickedImage!),),
          ],
        ),
      ),
    );
  }

  initiateImagePicker() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image == null) {
      return;
    }
    final tempImage = File(image.path);

    setState(() {
      pickedImage = tempImage;
    });
  }

  uploadImage(File pickedImage) async {
    var postUri = Uri.parse("<APIUrl>");
    var request = http.MultipartRequest("POST", postUri);
    request.fields['user'] = 'blah';
    request.files.add(http.MultipartFile.fromBytes('file', await File.fromUri(pickedImage.uri).readAsBytes(), contentType: MediaType('image', 'jpeg')))

    request.send().then((response) {
    if (response.statusCode == 200) print("Uploaded!");
    });
  }
}
