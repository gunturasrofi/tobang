part of 'services.dart';

class UserServices {
  static Future<ApiReturnValue<User>> signIn(String email, String password,
      {http.Client? client}) async {
    // ignore: unnecessary_null_comparison
    if (client == null) {
      client = http.Client();
    }

    var url = Uri.parse(baseUrl + 'login');
    var response = await http.post(url, headers: {
      "Content-Type": "application/x-www-form-urlencoded"
    }, body: {
      'username': email,
      'password': password,
    });

    if (response.statusCode != 200) {
      return ApiReturnValue(
        message: 'please try again',
      );
    } else {
      var data = jsonDecode(response.body);

      User.token = data['access_token'];
      User value = User.formJson(data['data']);

      return ApiReturnValue(value: value);
    }

    //return ApiReturnValue(message: "Wrong Email or Password");
  }

  static Future<ApiReturnValue<User>> signUp(String firstname, String lastname,
      String email, String hp, String password,
      {http.Client? client}) async {
    if (client == null) {
      client = http.Client();
    }

    var url = Uri.parse(baseUrl + 'users');
    var response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(
        <String, String>{
          'firstname': firstname,
          'lastname': lastname,
          'email': email,
          'password': password,
          'hp': hp,
          'grup': 'member'
        },
      ),
    );

    if (response.statusCode != 200) {
      return ApiReturnValue(
        message: 'Please try again',
      );
    } else {
      var datax = jsonDecode(response.body);

      // User.token = data['data']['access_token'];

      // User value = User.formJson(data['data']['user']);

      String value = datax['status']['kode'];

      if (value == 'success') {
        // String value = data['status']['kode'];

        User value = datax['status']['kode'];

        return ApiReturnValue(value: value);
      } else {
        // String value = data['status']['keterangan'];
        User value = datax['status']['keterangan'];

        return ApiReturnValue(value: value);
      }
    }
  }
}
