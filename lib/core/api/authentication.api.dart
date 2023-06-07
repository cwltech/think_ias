import 'package:http/http.dart' as http;

class AuthenticationAPI {
  final client = http.Client();
  final headers = {
    'Content-Type': 'application/json',
  };

  /* Create Account Api*/
  Future createAccount(
      {required String userName,
      required String userEmail,
      required String userPhoneNumber,
      required String userPassword}) async {
    print(
        "Repo ====>... Usernmae : $userName ... Email: $userEmail // password: $userPassword ... UserPhone: $userPhoneNumber");

    const subUrl = "https://cwltechnology.in/think-ias/ApiController/saveUser";
    final Uri uri = Uri.parse(subUrl);
    Map forBody = {};
    forBody["name"] = userName;
    forBody["email"] = userEmail;
    forBody["phone"] = userPhoneNumber;
    forBody["password"] = userPassword;
    // To Check Which Type Fo Body It's
    print("Create Account Body Type ========>${forBody.runtimeType}");
    print("Create Account Body Response(JSON) ============> $forBody");
    final http.Response response = await client.post(uri, body: forBody);
    print(response);
    final dynamic body = response.body;
    print("Account Created (JSON Object)======> $body");
    return body;
  }

  /// Login Account Function */
  Future loginAccount({
    required String userEmail,
    required String userPassword,
  }) async {
    const subUrl = "https://cwltechnology.in/think-ias/ApiController/userLogin";
    final Uri uri = Uri.parse(subUrl);
    Map forBody = {};
    forBody["login_email"] = userEmail;
    forBody["login_password"] = userPassword;
    final http.Response res = await client.post(uri, body: forBody);
    final dynamic body = res.body;
    print("User Login Message ======>$body ");
    return body;
  }
}
