import '../../data/models/login_request_model.dart';
import '../../data/models/login_response_model.dart';
import '../../data/models/signup_request_model.dart';

abstract class AuthRepository {
  Future<LoginResponseModel> login(LoginRequestModel loginRequest);

  Future<void> signup(SignupRequestModel signUpRequest);
}
