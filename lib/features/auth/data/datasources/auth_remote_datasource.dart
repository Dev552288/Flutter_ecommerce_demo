import 'package:dio/dio.dart';
import '../models/login_request_model.dart';
import '../models/login_response_model.dart';
import '../models/signup_request_model.dart';

abstract class AuthRemoteDatasource {
  Future<LoginResponseModel> login(LoginRequestModel loginRequest);

  Future<void> signup(SignupRequestModel request);
}
