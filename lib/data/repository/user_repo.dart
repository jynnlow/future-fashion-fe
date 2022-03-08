import 'package:future/data/api/api_client.dart';
import 'package:future/models/user_model.dart';
import 'package:future/utils/constants.dart';
import 'package:get/get_connect.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  UserRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> signUp(UserModel signupReq) async {
    //need to convert to json before sending the request body to the apiclient
    return await apiClient.post(Constants.SIGN_UP, signupReq.toJson());
  }

  Future<Response> signIn(UserModel signinReq) async {
    //need to convert to json before sending the request body to the apiclient
    return await apiClient.post(Constants.SIGN_IN, signinReq.toJson());
  }

  Future<Response> getPersonalInfo() async {
    return await apiClient.getMethod(Constants.GET_PERSONAL_INFO);
  }

  bool userLoggedIn() {
    //"containsKey" will return a bool
    // sharedPreferences.clear();
    return sharedPreferences.containsKey(Constants.TOKEN);
  }

  //save token into shared preference
  saveToken(String token) {
    apiClient.token = token;
    apiClient.updateHeader(token);
    sharedPreferences.setString(Constants.TOKEN, token);
  }

  //retrieve token from shared preference
  String getToken() {
    return sharedPreferences.getString(Constants.TOKEN) ?? "None";
  }

  bool clearSharedPreference() {
    sharedPreferences.remove(Constants.TOKEN);
    apiClient.token = '';
    apiClient.updateHeader('');
    return true;
  }
}
