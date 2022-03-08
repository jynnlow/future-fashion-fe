import 'package:flutter/material.dart';
import 'package:future/data/repository/user_repo.dart';
import 'package:future/models/response_model.dart';
import 'package:future/models/user_model.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class UserController extends GetxController implements GetxService {
  final UserRepo userRepo;
  UserController({required this.userRepo});

  Future<ResponseModel> signup(UserModel signupReq) async {
    late ResponseModel responseModel;
    Response response = await userRepo.signUp(signupReq);
    if (response.body['status'] == "FAIL") {
      responseModel = ResponseModel(false, response.body['message']);
    } else {
      responseModel = ResponseModel(true, response.body['message']);
    }
    update();
    return responseModel;
  }

  Future<ResponseModel> signin(UserModel signupReq) async {
    late ResponseModel responseModel;
    Response response = await userRepo.signIn(signupReq);
    if (response.body['status'] == "FAIL") {
      responseModel = ResponseModel(false, response.body['message']);
    } else {
      userRepo.saveToken(response.body['details']);
      responseModel = ResponseModel(true, response.body['message']);
      // print("Token from response -> " + response.body['details'].toString());
      // print("Token from sharedPreference -> " + userRepo.getToken());
    }
    update();
    return responseModel;
  }

  getPersonalInfo() async {
    Response response = await userRepo.getPersonalInfo();
    print(response.body);
  }

  bool userLoggedIn() {
    return userRepo.userLoggedIn();
  }

  bool loggout() {
    return userRepo.clearSharedPreference();
  }
}
