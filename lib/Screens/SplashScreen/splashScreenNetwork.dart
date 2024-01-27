import 'package:firebase_auth/firebase_auth.dart';
import '../../Modals/errors.dart';


class SplashNetwork {

  Future<User> getProfile() async {
    User? user = FirebaseAuth.instance.currentUser;
    if(user!=null) {
      return user;
    } else {
      throw CustomException("Error");
    }
  }
}

