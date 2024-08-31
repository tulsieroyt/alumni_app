import 'package:alumni_app/src/common/repositories/user_repository.dart';
import 'package:alumni_app/src/features/authentication/data/model/user_model.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  Rx<UserModel> user = UserModel.empty().obs;

  final userRepository = Get.put(UserRepository());

  Future<void> fetchUserData() async {
    try {
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      throw 'Something went wrong!. Please try again.';
    }
  }
}
