part of 'services.dart';

class UserServices {
  static Future<ApiReturnValue<User>> signIn(String email, String password,
      {http.Client client}) async {
    if (client == null) {
      client = http.Client();
    }

    String url = baseURL + 'login';

    debugPrint("baseurl: " + url);

    var response = await client.post(url,
        headers: {"Content-Type": "application/json"},
        body:
            jsonEncode(<String, String>{'email': email, 'password': password}));
    
debugPrint("status: " + response.statusCode.toString());

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Mohon coba lagi');
    }

    var data = jsonDecode(response.body);

    User.token = data['data']['access_token'];
    User value = User.fromJson(data['data']['user']);

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<User>> signUp(User user, String password,
      {File pictureFile, http.Client client}) async {
    if (client == null) {
      client = http.Client();
    }

    String url = baseURL + 'register';

    var response = await client.post(url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(<String, String>{
          'name': user.name,
          'email': user.email,
          'password': password,
          'password_confirmation': password,
          'address': user.address,
          'city': user.city,
          'houseNumber': user.houseNumber,
          'phoneNumber': user.phoneNumber
        }));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'please try again');
    }

    var data = jsonDecode(response.body);

    User.token = data['data']['access_token'];
    User value = User.fromJson(data['data']['user']);

    //todo: Upload pp
    if (pictureFile != null) {
      ApiReturnValue<String> result = await uploadProfilePicture(pictureFile);
      if (result.value != null) {
        value = value.copyWith(
            picturePath:
                "http://furniturbackend.test/api/storage/" + result.value);
      }
    }

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<String>> uploadProfilePicture(File pictureFile,
      {http.MultipartRequest request}) async {
    String url = baseURL + 'user/photo';
    var uri = Uri.parse(url);

    if (request == null) {
      request = http.MultipartRequest("POST", uri)
        ..headers["Content-Type"] = "application/json"
        ..headers["Authorization"] = "Bearer ${User.token}";
    }

    var multipartFile =
        await http.MultipartFile.fromPath('file', pictureFile.path);
    request.files.add(multipartFile);

    var response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      var data = jsonDecode(responseBody);

      String imagePath = data['data'][0];

      return ApiReturnValue(value: imagePath);
    } else {
      return ApiReturnValue(message: 'Upload foto profil gagal');
    }
  }
}
