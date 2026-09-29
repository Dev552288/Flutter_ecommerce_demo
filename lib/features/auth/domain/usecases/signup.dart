import 'package:ecommerce_app/features/auth/data/models/signup_request_model.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repository.dart';

class Signup {
  final AuthRepository repository;
  Signup(this.repository);

  Future<void> call(SignupRequestModel signUpRequest) {
    return repository.signup(signUpRequest);
  }
}
