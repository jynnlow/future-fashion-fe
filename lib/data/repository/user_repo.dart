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

  saveToken(String token) {}
}
