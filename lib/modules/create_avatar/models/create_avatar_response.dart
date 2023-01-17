class CreateAvatarResponse {
  Result? result;
  int? statusCode;
  String? description;

  CreateAvatarResponse({this.result, this.statusCode, this.description});

  CreateAvatarResponse.fromJson(Map<String, dynamic> json) {
    result =
    json['Result'] != null ? Result.fromJson(json['Result']) : null;
    statusCode = json['StatusCode'];
    description = json['Description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (result != null) {
      data['Result'] = result!.toJson();
    }
    data['StatusCode'] = statusCode;
    data['Description'] = description;
    return data;
  }
}

class Result {
  String? avatarId;
  int? gender;
  String? avatarIconUrl;

  Result({this.avatarId, this.gender, this.avatarIconUrl});

  Result.fromJson(Map<String, dynamic> json) {
    avatarId = json['AvatarId'];
    gender = json['Gender'];
    avatarIconUrl = json['AvatarIconUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['AvatarId'] = avatarId;
    data['Gender'] = gender;
    data['AvatarIconUrl'] = avatarIconUrl;
    return data;
  }
}
