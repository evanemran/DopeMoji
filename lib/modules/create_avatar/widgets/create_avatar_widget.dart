import 'dart:io';

import 'package:dope_moji/requests/requests.dart';
import 'package:dope_moji/styles/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:image_cropper/image_cropper.dart';

class CreateAvatar extends StatefulWidget {
  const CreateAvatar({Key? key}) : super(key: key);

  @override
  State<CreateAvatar> createState() => _CreateAvatarState();
}

class _CreateAvatarState extends State<CreateAvatar> {

  File? pickedImage;

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Create Avatar", style: AppText.appbarTagText,),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            pickedImage!=null ? Image.file(pickedImage!, width: size, height: size, fit: BoxFit.cover,) : Image.asset("assets/images/purple_pattern.png", width: size, height: size, fit: BoxFit.cover,),
            Row(children: [Expanded(child: Padding(padding: const EdgeInsets.fromLTRB(16,16,16,8), child: ElevatedButton(child: const Text("Choose"), onPressed: () => initiateImagePicker(),),))],),
            Row(children: [Expanded(child: Padding(padding: const EdgeInsets.fromLTRB(16,8,16,8), child: ElevatedButton(child: const Text("Upload"), onPressed: () {RequestManager.uploadImage(pickedImage!);},),))],),
          ],
        ),
      ),
    );
  }

  cropImagePicker() async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: pickedImage!.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.purple,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: true),
        IOSUiSettings(
          title: 'Cropper',
        ),
        WebUiSettings(
          context: context,
        ),
      ],
    );

    setState(() {
      pickedImage = File(croppedFile!.path);
    });
  }

  initiateImagePicker() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image == null) {
      return;
    }
    final tempImage = File(image.path);
    pickedImage = tempImage;

    cropImagePicker();

    // setState(() {
    //   pickedImage = tempImage;
    // });
  }

  uploadImage(File pickedImage) async {
    var postUri = Uri.parse("<APIUrl>");
    var request = http.MultipartRequest("POST", postUri);
    request.fields['user'] = 'blah';
    // request.files.add(http.MultipartFile.fromBytes('file', await File.fromUri(pickedImage.uri).readAsBytes(), contentType: MediaType('image', 'jpeg')))

    request.send().then((response) {
    if (response.statusCode == 200) print("Uploaded!");
    });
  }
}
