import 'dart:convert';

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

  Future<Response> editPersonalInfo(UserModel editReq) async {
    var token = getToken();
    print(token);
    return await apiClient.patchMethod(
        Constants.EDIT_PERSONAL_INFO, editReq.toJson(), token);
  }

  Future<Response> getPersonalInfo() async {
    return await apiClient.getMethod(Constants.GET_PERSONAL_INFO);
  }

  void addPersonalInfo(UserModel userModel) {
    String userJson = "";
    userJson = jsonEncode(userModel);
    sharedPreferences.setString(Constants.USER_PROFILE, userJson);
    print("Profile in local storage" +
        sharedPreferences.getString(Constants.USER_PROFILE)!);
    // getPersonalInfoFromSP();
  }

  UserModel getPersonalInfoFromSP() {
    String userJson = "";
    UserModel userModel = UserModel(username: "", password: "");
    if (sharedPreferences.containsKey(Constants.USER_PROFILE)) {
      userJson = sharedPreferences.getString(Constants.USER_PROFILE)!;
      userModel = UserModel.fromJson(jsonDecode(userJson));
    }
    return userModel;
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
    sharedPreferences.clear();
    print("Shared Preference ->" +
        sharedPreferences.containsKey(Constants.TOKEN).toString());
    return true;
  }
}
