import 'package:ecommerce_app/features/auth/data/models/login_request_model.dart';
import 'package:ecommerce_app/features/auth/data/models/login_response_model.dart';

import '../repositories/auth_repository.dart';

class Login {
  final AuthRepository repository;

  Login(this.repository);

  Future<LoginResponseModel> call(LoginRequestModel loginRequest) {
    return repository.login(loginRequest);
  }
}
