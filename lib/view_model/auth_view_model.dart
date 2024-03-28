import 'package:flutter/material.dart';
import 'package:mvvm_architecture_with_api_and_provider/repository/auth_repository.dart';
import 'package:mvvm_architecture_with_api_and_provider/utils/routes/routes.dart';
import 'package:mvvm_architecture_with_api_and_provider/utils/utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _signupLoading = false;
  bool get signupLoading => _signupLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setSignupLoading(bool value) {
    _signupLoading = value;
    notifyListeners();
  }

  final _authRepo = AuthRepository();

  Future<void> login(dynamic data, BuildContext context) async {
    setLoading(true);
    _authRepo.loginApi(data).then((value){
      setLoading(false);
      Utils.flushBarErrorMessage('Login Successful',context);
      Navigator.pushNamed(context, Routes.home);
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(),context);
    });
  }

  Future<void> signUp(dynamic data, BuildContext context) async {
    setSignupLoading(true);
    _authRepo.signUpApi(data).then((value){
      setSignupLoading(false);
      Utils.flushBarErrorMessage('SignUp Successful',context);
      Navigator.pushNamed(context, Routes.home);
    }).onError((error, stackTrace) {
      setSignupLoading(false);
      Utils.flushBarErrorMessage(error.toString(),context);
    });
  }

}
