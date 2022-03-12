import 'package:flutter/material.dart';
import 'package:future/data/repository/user_repo.dart';
import 'package:future/models/response_model.dart';
import 'package:future/models/user_model.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class UserController extends GetxController implements GetxService {
  final UserRepo userRepo;
  UserController({required this.userRepo});

  late UserModel _userModel = UserModel(username: "", password: "");
  UserModel get userModel => _userModel;

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
      getPersonalInfo();
    }
    update();
    return responseModel;
  }

  Future<ResponseModel> editPersonalInfo(UserModel editReq) async {
    late ResponseModel responseModel;
    Response response = await userRepo.editPersonalInfo(editReq);
    if (response.body['status'] == "FAIL") {
      responseModel = ResponseModel(false, response.body['message']);
    } else {
      _userModel = UserModel.fromJson(response.body['details']);
      userRepo.addPersonalInfo(_userModel);
      responseModel = ResponseModel(true, response.body['message']);
    }
    update();
    return responseModel;
  }

  UserModel getPersonalInfoFromSP() {
    _userModel = userRepo.getPersonalInfoFromSP();
    update();
    return userModel;
  }

  getPersonalInfo() async {
    //get personal info from db once the user sign in their account
    Response response = await userRepo.getPersonalInfo();
    //convert json string to user model object
    _userModel = UserModel.fromJson(response.body['details']);
    //add user personal info to the local storage
    userRepo.addPersonalInfo(_userModel);
    update();
  }

  bool checkIfUserLoggedIn() {
    return userRepo.userLoggedIn();
  }

  void loggout() {
    userRepo.clearSharedPreference();
    print("Log Out -> User Controller -> " + checkIfUserLoggedIn().toString());
    update();
  }
}
