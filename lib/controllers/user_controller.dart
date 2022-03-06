import 'package:future/data/repository/user_repo.dart';
import 'package:future/models/user_model.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class UserController extends GetxController implements GetxService {
  final UserRepo userRepo;
  UserController({required this.userRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  signup(UserModel signupReq) async {
    _isLoading = true;
    Response response = await userRepo.signUp(signupReq);
    if (response.body['status'] == "FAIL") {
    } else {}
  }
}
