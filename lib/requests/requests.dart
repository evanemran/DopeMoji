import 'dart:io';
import 'package:dope_moji/requests/api_constants.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../modules/create_avatar/models/create_avatar_response.dart';

class RequestManager {
  var headers = {
    'Content-Type': 'multipart/form-data',
    'X-RapidAPI-Key': ApiConst.apiKey,
    'X-RapidAPI-Host': 'mojipop.p.rapidapi.com',
  };


  static uploadImage(File pickedImage) async {
    var headers = {
      'Content-Type': 'multipart/form-data',
      'X-RapidAPI-Key': ApiConst.apiKey,
      'X-RapidAPI-Host': 'mojipop.p.rapidapi.com',
    };
    var postUri = Uri.parse(ApiConst.baseUrl+ApiConst.createAvatar);
    var request = http.MultipartRequest("POST", postUri);
    request.headers.addAll(headers);
    request.fields['photo'] = 'photo';
    request.fields['createIcon'] = 'true';
    request.files.add(http.MultipartFile.fromBytes('file', await File.fromUri(pickedImage.uri).readAsBytes(), contentType: MediaType('image', 'jpeg')));

    request.send().then((response) async {
      if (response.statusCode == 200) {

        var resp = await http.Response.fromStream(response);
        CreateAvatarResponse model = resp.body as CreateAvatarResponse;
        print(model.result?.gender.toString());

        print("Uploaded!");
      }
      else {
        print("error occurred!!!");
      }
    });
  }
}